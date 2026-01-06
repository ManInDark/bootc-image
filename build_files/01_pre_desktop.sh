#!/bin/bash

set -ouex pipefail

cp /ctx/bootc-fetch-apply-updates.service /usr/lib/systemd/system/bootc-fetch-apply-updates.service
cp /ctx/os-release /usr/lib/os-release

echo "LANG=de_DE.UTF-8" >> /etc/default/locale
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
ln -s /usr/bin/xdg-open /usr/bin/open

dnf5 update -y --setopt=install_weak_deps=False
dnf5 install -y man-pages man-db glibc-langpack-en glibc-langpack-de default-fonts-cjk plymouth git