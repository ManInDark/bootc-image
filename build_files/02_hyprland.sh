#!/bin/bash

set -ouex pipefail

dnf5 copr enable -y solopasha/hyprland
dnf5 install -y \
    hyprland \
    hypridle \
    hyprlock \
    hyprpolkitagent \
    waybar \
    pavucontrol

cp /ctx/hypr* /usr/lib/systemd/system
for service in $(ls /ctx/hypr*); do
	systemctl enable $service;
done
