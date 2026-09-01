#!/usr/bin/env bash
# Builds the ISO. Must be run on Debian (or a Debian-family distro) with
# live-build installed, and needs root.
set -euo pipefail

if ! command -v lb &>/dev/null; then
    echo "live-build not found. Install it with: sudo apt install live-build"
    exit 1
fi

echo "==> Configuring build (auto/config)"
lb config

echo "==> Building ISO (this can take 20-40 minutes the first time)"
lb build

echo "==> Done. Look for live-image-amd64.hybrid.iso in this folder."
