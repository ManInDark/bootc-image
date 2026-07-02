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
    foot

cp /ctx/hyprland.service /usr/lib/systemd/user/hyprland.service
systemctl --global enable hyprland.service
