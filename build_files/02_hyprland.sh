#!/bin/bash

set -ouex pipefail

dnf5 copr enable -y solopasha/hyprland
dnf5 copr enable -y erikreider/SwayNotificationCenter
dnf5 install -y \
    hyprland \
    hypridle \
    hyprlock \
    hyprpolkitagent \
    waybar \
    pavucontrol \
    cliphist \
    SwayNotificationCenter-git

echo 'if [[ $(ps aux | grep hyprland | wc -l) -eq 1 ]]; then cd $HOME && echo "launch hyprland?" && read && systemd-run --user --service-type=exec --unit=hyprland --description="hyprland start service" hyprland ; fi' >> /etc/profile.d/launch_hyprland.sh
