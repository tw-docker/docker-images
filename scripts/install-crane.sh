#!/usr/bin/env bash
set -euo pipefail

archive="$RUNNER_TEMP/crane.tar.gz"
curl --fail --silent --show-error --location --retry 3 \
  https://github.com/google/go-containerregistry/releases/download/v0.22.1/go-containerregistry_Linux_x86_64.tar.gz \
  --output "$archive"
printf '%s  %s\n' 0ab7a1d6932a213aed964ce97666c3077fe691c8606413674a8b3e0b9ec4cda0 "$archive" | sha256sum --check
tar -xzf "$archive" -C "$RUNNER_TEMP" crane
