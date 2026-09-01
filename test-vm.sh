#!/usr/bin/env bash
# Boots the built ISO in QEMU for quick testing.
set -euo pipefail

ISO="$(find . -maxdepth 1 -name '*.hybrid.iso' | sort | tail -n1)"

if [ -z "${ISO:-}" ]; then
    echo "No ISO found. Run ./build.sh first."
    exit 1
fi

echo "==> Booting $ISO"
# intel-hda gives you a chance to test PipeWire inside the VM.
# Wi-Fi firmware still needs real hardware (or a USB dongle passthrough).
qemu-system-x86_64 \
    -m 4G \
    -smp 2 \
    -enable-kvm \
    -boot d \
    -cdrom "$ISO" \
    -vga virtio \
    -display gtk \
    -device intel-hda \
    -device hda-duplex
