#!/bin/bash

set -ouex pipefail

dnf5 update -y
dnf5 install -y man-pages man-db glibc-langpack-en glibc-langpack-de
dnf5 install -y --setopt=exclude=gnome-tour,malcontent-control gnome-shell gnome-keyring gnome-keyring-pam gnome-bluetooth gnome-terminal nautilus seahorse evolution gnome-extensions-app gnome-shell-extension-appindicator
dnf5 install -y gnome-calculator gnome-disk-utility gnome-backgrounds
dnf5 install -y curl git btop nvtop tmux flatpak pciutils tailscale make fzf direnv wl-clipboard chromium
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "LANG=de_DE.UTF-8" >> /etc/default/locale
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
systemctl enable tailscaled.service
systemctl disable sshd.service
# Install VSCode: https://packages.microsoft.com/yumrepos/vscode/
curl -fsSLo /etc/yum.repos.d/vscode.repo https://packages.microsoft.com/yumrepos/vscode/config.repo
rpm-ostree install code
rm /etc/yum.repos.d/vscode.repo
dnf5 clean all
