#!/bin/bash

set -ouex pipefail

dnf5 install -y --setopt=install_weak_deps=False \
	niri \
	niri-settings \
	waybar \
	foot \
	swaylock

ln -s /usr/bin/foot /usr/bin/alacritty # for niri default config
