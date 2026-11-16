#!/usr/bin/env bash
set -euo pipefail

[[ "$HEAD_SHA" =~ ^[a-f0-9]{40}$ ]]
pr=$(gh api "repos/$GITHUB_REPOSITORY/commits/$HEAD_SHA/pulls" --jq '
  [.[] | select(.state == "open" and .user.login == "dependabot[bot]" and .base.ref == "main")] |
  if length == 1 then .[0].number else empty end')
[[ -n "$pr" ]] || exit 0
[[ "$(gh pr view "$pr" --json headRefOid --jq .headRefOid)" == "$HEAD_SHA" ]] || exit 0

files=$(gh api --paginate "repos/$GITHUB_REPOSITORY/pulls/$pr/files" --jq '.[] | .filename')
[[ "$files" =~ ^images/([a-z0-9][a-z0-9.-]*)/Dockerfile$ ]] || exit 0
image=${BASH_REMATCH[1]}
patch=$(gh api "repos/$GITHUB_REPOSITORY/pulls/$pr/files" --jq '.[0].patch')
if ! PATCH="$patch" python3 - <<'PY'
import os
import re

lines = os.environ["PATCH"].splitlines()
changes = [line for line in lines if line.startswith(("-", "+"))]
if len(changes) != 2:
    raise SystemExit(1)

before, after = [re.fullmatch(r"[-+]FROM ([^ @]+)@sha256:[0-9a-f]{64}", line) for line in changes]
raise SystemExit(0 if before and after and before[1] == after[1] else 1)
PY
then
  exit 0
fi

gh pr merge "$pr" --squash --match-head-commit "$HEAD_SHA"
[[ "$(gh pr view "$pr" --json state --jq .state)" == MERGED ]]
gh workflow run publish.yml --ref main -f "image=$image"
