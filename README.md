# custom bootc image

This repository contains all information necessary to build my very own customized bootc image.

I've attached various links I used to learn about how all of this works below, they are in no particular order.

## Build

A qcow image may be built by first calling `make oci` to build the oci image and then `make qcow` to turn it into a bootable qcow image. For hardware installation, I recommend the anaconda-iso variant.

You should adapt user & disk settings in `disk_config/user.toml` before you build your own installation iso though.

It may be necessary to create your own keys: https://github.com/CheariX/silverblue-akmods-keys

## Links

- [getting started](https://docs.fedoraproject.org/en-US/bootc/building-containers)
- [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/download) is a fully prepared gnome desktop distribution.
- [cicd-bootc](https://github.com/nzwulfin/cicd-bootc) example repository with github action workflow for building images
- [universal-blue](https://universal-blue.org) prebuilt image provider (Aurora, Bazzite, Bluefin, uCore)
- [image building guidance](https://bootc-dev.github.io/bootc/building/guidance.html)
- [authentication in images](https://docs.fedoraproject.org/en-US/bootc/authentication)
- [provisioning with qemu and libvirt](https://docs.fedoraproject.org/en-US/bootc/qemu-and-libvirt)
- [fedora base images](https://docs.fedoraproject.org/en-US/bootc/base-images)
- [bootc image builder](https://github.com/osbuild/bootc-image-builder)
- [building bootc images from scratch](https://docs.fedoraproject.org/en-US/bootc/building-from-scratch)
- [building derived images](https://docs.fedoraproject.org/en-US/bootc/building-containers)
- [osbuild partitioning](https://osbuild.org/docs/user-guide/partitioning)
- [osbuild blueprint reference](https://osbuild.org/docs/user-guide/blueprint-reference)
- [filesystem guide](https://bootc-dev.github.io/bootc/filesystem.html)

## Installed Software

- man
- langpacks: en, de
- Gnome + Software
- curl
- git
- btop
- nvtop
- tmux
- pciutils
- tailscale
- make
- fzf
- direnv
- wl-clipboard
- ffmpeg
- Flatpak (with default repository configured)
- Chromium
- VSCode
- NVIDIA Drivers
