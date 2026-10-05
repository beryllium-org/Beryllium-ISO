#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="Beryllium-OS-ORION-O6"
iso_label="BERYLLIUM_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
iso_publisher="Beryllium ORG <https://beryllium.gr>"
iso_application="Beryllium OS Live/Rescue ISO"
install_dir="arch"
buildmodes=('iso')
## GRUB
bootmodes=('uefi-arm64.grub.esp' 'uefi-arm64.grub.eltorito')
arch="aarch64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'arm64' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
    ["/etc/shadow"]="0:0:400"
    ["/etc/gshadow"]="0:0:400"
    ["/root"]="0:0:750"
    ["/etc/polkit-1/rules.d"]="0:0:750"
    ["/etc/sudoers.d"]="0:0:750"
    ["/etc/sudoers.d/g_wheel"]="0:0:440"
    ["/etc/"]="0:0:755"
    ["/usr/bin/resizefs"]="0:0:755"
    ["/usr/bin/zswap-arm-ctrl"]="0:0:755"
    ["/usr/bin/pacman-init"]="0:0:755"
    ["/usr/bin/oemcleanup"]="0:0:755"
    ["/usr/lib"]="0:0:755"
    ["/usr/bin"]="0:0:755"
    ["/usr"]="0:0:755"
    ["/home/beryl/.config/autostart/org.beryllium.bakery.desktop"]="1001:1001:755"
    ["/home/beryl/Desktop/org.beryllium.bakery.desktop"]="1001:1001:755"
    ["/home/beryl/"]="1001:1001:750"
    ["/home"]="0:0:755"
)
