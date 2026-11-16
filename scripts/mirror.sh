#!/usr/bin/env bash
set -euo pipefail

mode=$1
image=$2
trivy=$3
crane="$RUNNER_TEMP/crane"
[[ -x "$crane" ]] || bash scripts/install-crane.sh

read -r instruction source < "images/$image/Dockerfile"
[[ "$instruction" == FROM && "$source" =~ @sha256:[a-f0-9]{64}$ ]]
upstream=${source%@*}
if [[ ${upstream##*/} == *:* ]]; then
  upstream=${upstream%:*}
fi
pinned="$upstream@${source##*@}"
digest=$("$crane" digest --platform linux/amd64 "$pinned")
[[ "$digest" =~ ^sha256:[a-f0-9]{64}$ ]]
platform_image="$upstream@$digest"
"$crane" manifest "$platform_image" >/dev/null

if [[ "$GITHUB_EVENT_NAME" == pull_request ]]; then
  docker run --rm "$trivy" image --platform linux/amd64 --scanners vuln \
    --severity HIGH,CRITICAL --exit-code 1 --timeout 8m "$platform_image"
fi

if [[ "$mode" == publish ]]; then
  destination="ghcr.io/tw-docker/$image"
  snapshot="sha256-${digest:7:16}"
  "$crane" copy "$platform_image" "$destination:$snapshot"
  test "$("$crane" digest "$destination:$snapshot")" = "$digest"
  "$crane" tag "$destination:$snapshot" stable
  test "$("$crane" digest "$destination:stable")" = "$digest"
fi
