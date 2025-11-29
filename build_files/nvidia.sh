rpm-ostree install -y rpmdevtools akmods
rpm-ostree install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                      https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
rpm-ostree install -y ffmpeg x265-libs

# https://rpmfusion.org/Howto/NVIDIA
# https://www.tecmint.com/install-nvidia-drivers-in-linux
# https://github.com/ublue-os/akmods
# https://github.com/Comprehensive-Wall28/Nvidia-Fedora-Guide
# following Nvidia-Fedora-Guide installation
rpm-ostree install -y akmod-nvidia xorg-x11-drv-nvidia-cuda # xorg-x11-drv-nvidia

dnf5 clean all