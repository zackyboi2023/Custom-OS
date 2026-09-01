#!/usr/bin/env bash
# Boots the most recently built ISO in QEMU for quick testing.
set -euo pipefail

ISO="$(find out -maxdepth 1 -name '*.iso' | sort | tail -n1)"

if [ -z "${ISO:-}" ]; then
    echo "No ISO found in out/. Run ./build.sh first."
    exit 1
fi

echo "==> Booting $ISO"
qemu-system-x86_64 \
    -m 4G \
    -smp 2 \
    -enable-kvm \
    -boot d \
    -cdrom "$ISO" \
    -vga virtio \
    -display gtk
