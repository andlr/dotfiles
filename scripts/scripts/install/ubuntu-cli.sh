#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

sudo apt install -y \
	curl \
	wget \
	neovim \
	stow \
	tmux \
	git \
	zsh

"${SCRIPT_DIR}"/shell-plugins.sh

user="${SUDO_USER:-$USER}"
sudo usermod -s /bin/zsh "$user"

