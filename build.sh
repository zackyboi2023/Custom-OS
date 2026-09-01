#!/usr/bin/env bash
# Builds the ISO. Must be run on Arch Linux (archiso is an Arch-only tool),
# and needs root (mkarchiso creates loopback/squashfs images).
set -euo pipefail

if ! command -v mkarchiso &>/dev/null; then
    echo "mkarchiso not found. Install it with: sudo pacman -S archiso"
    exit 1
fi

WORKDIR="$(mktemp -d)"
OUTDIR="$(pwd)/out"
RELENG="/usr/share/archiso/configs/releng"

echo "==> Staging profile in $WORKDIR"
cp -r "$RELENG"/. "$WORKDIR/"
cp -rf ./profile/. "$WORKDIR/"

echo "==> Building ISO (this can take 10-30 minutes the first time)"
mkarchiso -v -w "$WORKDIR/work" -o "$OUTDIR" "$WORKDIR"

echo "==> Done. ISO is in $OUTDIR"
