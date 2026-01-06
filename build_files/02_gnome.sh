#!/bin/bash

set -ouex pipefail

dnf5 install -y --setopt=exclude=gnome-tour,malcontent-control \
    gnome-shell \
    gnome-terminal \
    gnome-bluetooth \
    gnome-calculator \
    gnome-disk-utility \
    gnome-extensions-app \
    gnome-browser-connector \
    gnome-backgrounds \
    gnome-shell-extension-appindicator
dnf5 install -y  \
    totem \
    nautilus \
    seahorse \
    gstreamer1-plugin-libav

git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com