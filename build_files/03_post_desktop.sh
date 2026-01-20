#!/bin/bash

set -ouex pipefail

dnf5 install -y \
    gnome-keyring \
    gnome-keyring-pam \
    evolution \
    fzf \
    vlc \
    curl \
    btop \
    tmux \
    make \
    xsel \
    7zip \
    nvtop \
    direnv \
    sqlite \
    flatpak \
    chromium \
    pciutils \
    nautilus \
    tailscale \
    podman-compose \
    netcat tor torbrowser-launcher \
    ansible-core ansible-collection-community-general \
    pandoc-common pandoc-pdf texlive-collection-langgerman \
    hugo

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

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

cp /ctx/login /etc/pam.d

