#!/bin/bash

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
    font-manager \
    pulseaudio \
    pavucontrol

# Create symlinks
stow kitty bspwm dunst

pushd /tmp || exit

# Install bspwm
git clone https://github.com/baskerville/bspwm.git

pushd bspwm || exit
make
sudo make install
popd || exit # ./bspwm

# Install sxhkd
git clone https://github.com/baskerville/sxhkd.git
pushd sxhkd || exit
make
sudo make install
popd || exit # ./sxhkd

# Install rofi themes
git clone --depth=1 https://github.com/adi1090x/rofi.git
pushd rofi || exit
chmod +x setup.sh
./setup.sh
popd || exit # ./rofi

popd || exit # /tmp

