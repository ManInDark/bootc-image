#!/bin/bash

set -ouex pipefail

dnf5 install -y pacman

pacman -Sy && \
PACMAN_TZDATA=$(pacman -Q tzdata | sed 's/ /=/') && \
PACMAN_FILESYSTEM=$(pacman -Q filesystem | sed 's/ /=/') && \
PACMAN_GLIBC=$(pacman -Q glibc | sed 's/ /=/') && \
PACMAN_LIBGCC=$(pacman -Q libgcc | sed 's/ /=/') && \
PACMAN_LIBGOMP=$(pacman -Q libgomp | sed 's/ /=/') && \
PACMAN_LIBSTDCPP=$(pacman -Q libstdc++ | sed 's/ /=/') && \
PACMAN_NCURSES=$(pacman -Q ncurses | sed 's/ /=/') && \
PACMAN_READLINE=$(pacman -Q readline | sed 's/ /=/') && \
PACMAN_BASH=$(pacman -Q bash | sed 's/ /=/') && \
PACMAN_EXPAT=$(pacman -Q expat | sed 's/ /=/') && \
PACMAN_BZIP2=$(pacman -Q bzip2 | sed 's/ /=/') && \
PACMAN_ZLIB=$(pacman -Q zlib | sed 's/ /=/') && \
PACMAN_LIBPNG=$(pacman -Q libpng | sed 's/ /=/') && \
PACMAN_FONTCONFIG=$(pacman -Q fontconfig | sed 's/ /=/') && \
AI="--assume-installed" && \
PACMAN_ASSUME_INSTALLED="$AI $PACMAN_TZDATA $AI $PACMAN_FILESYSTEM $AI $PACMAN_GLIBC $AI $PACMAN_LIBGCC $AI $PACMAN_LIBGOMP $AI $PACMAN_LIBSTDCPP $AI $PACMAN_NCURSES $AI $PACMAN_READLINE $AI $PACMAN_BASH $AI $PACMAN_EXPAT $AI $PACMAN_BZIP2 $AI $PACMAN_ZLIB $AI $PACMAN_LIBPNG $AI $PACMAN_FONTCONFIG" \
yes | pacman -Sy --assume-installed $PACMAN_ASSUME_INSTALLED \
	librsvg

yes | pacman -Sy --assume-installed $PACMAN_ASSUME_INSTALLED \
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
