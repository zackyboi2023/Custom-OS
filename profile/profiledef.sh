#!/usr/bin/env bash
# archiso profile definition. Overrides the releng defaults with this
# distro's naming. See `man mkarchiso` and the releng profiledef.sh for
# every available option.

iso_name="mydistro"                 # rename this
iso_label="MYDISTRO_$(date +%Y%m)"  # and this (must be uppercase, no spaces)
iso_publisher="Your Name <https://github.com/yourusername>"
iso_application="MyDistro Live/Rescue ISO"
iso_version="$(date +%Y.%m.%d)"
install_dir="mydistro"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)
