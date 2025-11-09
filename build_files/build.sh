#!/bin/bash

set -ouex pipefail

dnf5 update -y
dnf5 install -y glibc-langpack-en glibc-langpack-de
dnf5 install -y --setopt=exclude=gnome-tour,malcontent-control gnome-shell gnome-keyring gnome-keyring-pam gnome-bluetooth alacritty
dnf5 install -y gnome-calculator gnome-disk-utility gnome-backgrounds
dnf5 install -y curl git btop tmux flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "LANG=de_DE.UTF-8" >> /etc/default/locale
# Install Brave: https://brave.com/linux/
curl -fsSLo /etc/yum.repos.d/brave-browser.repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
rpm-ostree install brave-browser
rm /etc/yum.repos.d/brave-browser.repo
# Install Steam: https://docs.fedoraproject.org/en-US/gaming/proton/#_using_the_terminal
dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
                dnf-plugins-core
sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/fedora-cisco-openh264.repo
dnf5 install -y steam discord
dnf5 remove -y rpmfusion-free-release rpmfusion-nonfree-release dnf-plugins-core
dnf5 clean all
