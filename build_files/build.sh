#!/bin/bash

set -ouex pipefail
cp /ctx/bootc-fetch-apply-updates.service /usr/lib/systemd/system/bootc-fetch-apply-updates.service
cp /ctx/os-release /usr/lib/os-release

dnf5 update -y --setopt=install_weak_deps=False
dnf5 install -y man-pages man-db glibc-langpack-en glibc-langpack-de default-fonts-cjk plymouth
dnf5 install -y --setopt=exclude=gnome-tour,malcontent-control gnome-shell gnome-keyring gnome-keyring-pam gnome-bluetooth gnome-terminal nautilus seahorse evolution totem gstreamer1-plugin-libav gnome-extensions-app gnome-browser-connector gnome-shell-extension-appindicator
dnf5 install -y gnome-calculator gnome-disk-utility gnome-backgrounds
dnf5 install -y curl git btop nvtop tmux flatpak pciutils tailscale make fzf direnv xsel chromium 7zip pandoc-common pandoc-pdf texlive-collection-langgerman ansible-core ansible-collection-community-general vlc sqlite netcat tor torbrowser-launcher podman-compose hugo
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

dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y --allowerasing ffmpeg x265-libs

# Install Veracrypt: https://veracrypt.io/en/Downloads.html
dnf5 install -y https://launchpad.net/veracrypt/trunk/1.26.24/+download/veracrypt-1.26.24-Fedora-40-x86_64.rpm

dnf5 remove  -y rpmfusion-free-release rpmfusion-nonfree-release
dnf5 clean all
