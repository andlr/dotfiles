#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

sudo apt install -y \
	polybar \
	dunst \
	kitty \
	brightnessctl \
	make \
	gcc \
	g++ \
	libxcb-xinerama0-dev \
	libxcb-icccm4-dev \
	libxcb-randr0-dev \
	libxcb-util0-dev \
	libxcb-ewmh-dev \
	libxcb-keysyms1-dev \
	libxcb-shape0-dev \
	rofi \
	feh \
	font-manager

pushd /tmp
# Install bspwm
git clone https://github.com/baskerville/bspwm.git
pushd bspwm
make
sudo make install
popd
# Install sxhkd
git clone https://github.com/baskerville/sxhkd.git
pushd sxhkd
make
sudo make install
popd
# Install rofi themes
git clone --depth=1 https://github.com/adi1090x/rofi.git
pushd rofi
chmod +x setup.sh
./setup.sh
popd
popd

# Create symlinks
stow kitty bspwm dunst

