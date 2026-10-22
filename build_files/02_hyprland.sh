#!/bin/bash

set -ouex pipefail

dnf5 copr enable -y lionheartp/Hyprland
dnf5 copr enable -y erikreider/SwayNotificationCenter
dnf5 install -y \
    hyprland \
    hypridle \
    hyprlock \
    hyprshot \
    hyprpolkitagent \
    hyprland-guiutils \
    waybar \
    pavucontrol \
    cliphist \
    SwayNotificationCenter-git \
    foot \
    xdg-desktop-portal \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk

cp /ctx/hyprland.service /usr/lib/systemd/user/hyprland.service
systemctl --global enable hyprland.service
