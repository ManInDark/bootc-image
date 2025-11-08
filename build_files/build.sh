#!/bin/bash

set -ouex pipefail

dnf5 install -y glibc-langpack-en glibc-langpack-de
dnf5 install -y --setopt=exclude=gnome-tour,malcontent-control gnome-shell gnome-keyring gnome-keyring-pam gnome-bluetooth alacritty
dnf5 install -y gnome-calculator gnome-disk-utility gnome-backgrounds
dnf5 install -y curl git btop tmux flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "LANG=de_DE.UTF-8" >> /etc/default/locale
dnf update -y
dnf clean all
