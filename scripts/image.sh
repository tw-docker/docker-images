#!/usr/bin/env bash
set -euo pipefail

mode=$1
image=$2
[[ "$mode" == check || "$mode" == publish ]]
[[ "$image" =~ ^[a-z0-9][a-z0-9.-]*$ ]]
test -f "images/$image/Dockerfile"

registry=ghcr.io/tw-docker/docker-images
candidate="$registry:$image-${GITHUB_SHA:0:12}-$GITHUB_RUN_ID-$GITHUB_RUN_ATTEMPT"
stable="$registry:$image-stable"
trivy=ghcr.io/aquasecurity/trivy:0.76.2@sha256:8f6bb947dbc528902e11f2f5be52f7b519f6a39d5d148f41166f2040499768fb

docker build --pull --no-cache --platform linux/amd64 \
  --label "org.opencontainers.image.source=$GITHUB_SERVER_URL/$GITHUB_REPOSITORY" \
  --label "org.opencontainers.image.revision=$GITHUB_SHA" \
  --tag "$candidate" "images/$image"

scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
if [[ "$image" == excalidraw-patch ]]; then
  container=$(docker run --detach --publish 127.0.0.1::80 "$candidate")
  trap 'docker rm --force "$container" >/dev/null; rm -rf "$scratch"' EXIT
  endpoint=$(docker port "$container" 80/tcp)
  curl -fsS --retry 12 --retry-connrefused --max-time 5 "http://$endpoint/" -o "$scratch/index.html"
  grep -qi excalidraw "$scratch/index.html"
  stable="$registry:stable"
else
  docker run --rm --network none --entrypoint /bin/sh "$candidate" -ec 'true'
fi
docker save -o "$scratch/image.tar" "$candidate"
docker run --rm -v "$scratch/image.tar:/image.tar:ro" "$trivy" image \
  --input /image.tar --scanners vuln --severity HIGH,CRITICAL --exit-code 1 --timeout 8m

if [[ "$mode" == publish ]]; then
  docker push "$candidate"
  docker tag "$candidate" "$stable"
  docker push "$stable"
fi
