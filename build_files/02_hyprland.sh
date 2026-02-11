#!/bin/bash

set -ouex pipefail

dnf5 install -y pacman

yes | pacman -Sy \
	librsvg

yes | pacman -Sy \
	hyprland \
	hypridle \
	hyprlock \
	hyprshot \
	hyprpolkitagent \
	cliphist

dnf5 copr enable -y erikreider/SwayNotificationCenter
dnf5 install -y \
    waybar \
    pavucontrol \
    SwayNotificationCenter-git \
    foot

echo 'if [[ $(ps aux | grep hyprland | wc -l) -eq 1 ]]; then cd $HOME && echo "launch hyprland?" && read && systemd-run --user --service-type=exec --unit=hyprland --description="hyprland start service" hyprland ; fi' >> /etc/profile.d/launch_hyprland.sh
