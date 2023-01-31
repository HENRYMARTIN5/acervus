#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="acervus"
iso_label="ACERVUS_$(date +%Y%m)"
iso_publisher="Henry Martin <http://henrymartin.co/>"
iso_application="Acervus - the powerful, complete, arch-based distro"
iso_version="$(date +%Y.%m.%d)"
install_dir="acervus"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlzma,9' -E ztailpacking)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)