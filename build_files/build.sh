#!/bin/bash

set -ouex pipefail

dnf5 update -y
dnf5 install -y man-pages man-db glibc-langpack-en glibc-langpack-de
dnf5 install -y --setopt=exclude=gnome-tour,malcontent-control gnome-shell gnome-keyring gnome-keyring-pam gnome-bluetooth gnome-terminal nautilus seahorse evolution totem gnome-extensions-app gnome-browser-connector gnome-shell-extension-appindicator
dnf5 install -y gnome-calculator gnome-disk-utility gnome-backgrounds
dnf5 install -y curl git btop nvtop tmux flatpak pciutils tailscale make fzf direnv xsel chromium ffmpeg-free
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

dnf5 install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig \
                akmod-nvidia xorg-x11-drv-nvidia-cuda \
                libva-utils vdpauinfo
dnf5 remove -y  rpmfusion-free-release rpmfusion-nonfree-release

dnf5 clean all
