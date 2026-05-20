#!/bin/bash

set -ouex pipefail

dnf5 install -y --setopt=install_weak_deps=False \
	niri \
	niri-settings \
	waybar \
	foot
