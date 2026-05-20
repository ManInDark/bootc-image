#!/bin/bash

set -ouex pipefail

dnf5 install -y \
	niri \
	niri-settings
