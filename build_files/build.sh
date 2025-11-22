#!/bin/bash

set -ouex pipefail
cp /ctx/bootc-fetch-apply-updates.service /usr/lib/systemd/system/bootc-fetch-apply-updates.service

dnf5 update -y
dnf5 install -y man-pages man-db glibc-langpack-en glibc-langpack-de plymouth
dnf5 install -y --setopt=exclude=gnome-tour,malcontent-control gnome-shell gnome-keyring gnome-keyring-pam gnome-bluetooth gnome-terminal nautilus seahorse evolution totem gnome-extensions-app gnome-browser-connector gnome-shell-extension-appindicator
dnf5 install -y gnome-calculator gnome-disk-utility gnome-backgrounds
dnf5 install -y curl git btop nvtop tmux flatpak pciutils tailscale make fzf direnv xsel chromium ffmpeg-free 7zip
git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "LANG=de_DE.UTF-8" >> /etc/default/locale
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
ln -s /usr/bin/xdg-open /usr/bin/open
systemctl enable tailscaled.service
systemctl disable sshd.service
# Install VSCode: https://packages.microsoft.com/yumrepos/vscode/
curl -fsSLo /etc/yum.repos.d/vscode.repo https://packages.microsoft.com/yumrepos/vscode/config.repo
rpm-ostree install code
rm /etc/yum.repos.d/vscode.repo

# https://rpmfusion.org/Howto/NVIDIA
# https://www.tecmint.com/install-nvidia-drivers-in-linux
# https://github.com/ublue-os/akmods
# https://github.com/ublue-os/bazzite
# https://github.com/Comprehensive-Wall28/Nvidia-Fedora-Guide
# this is a combination of bazzite & ublue-os nvidia installation
# there is probably a better way to do it, but this works (I hope)
dnf install -y \
    /nvidia-kernel/rpms/ublue-os/ublue-os-nvidia*.rpm \
    /nvidia-kernel/rpms/kmods/kmod-nvidia*.rpm \
    /nvidia-packages/nvidia-kmod-common-* \
    /nvidia-packages/nvidia-modprobe-5*

dnf5 clean all
