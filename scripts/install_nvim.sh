#!/usr/bin/env bash

if [[ -z $PATH_PREFIX ]]; then
	export PATH_PREFIX=$HOME/.local/bin/
fi

read -r -p "Installing neovim to $PATH_PREFIX? [Y/n]" response
response=${response,,} # tolower
if [[ ! $response =~ ^(y| ) ]] && [[ ! -z $response ]]; then
	printf "Cancelling install..."
	exit
fi

# Get latest release, unzip and install it
mkdir -p $PATH_PREFIX
if [ -w $PATH_PREFIX ]; then
	wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
	&& chmod 755 nvim.appimage \
	&& rm -rf $PATH_PREFIX/nvim \
	&& mv nvim.appimage $PATH_PREFIX/nvim
else
	printf "Error: can't write to $PATH_PREFIX\n"
	exit 1
fi

# TO DO:
# - custom install path
# - wget to tmp dir in dotfiles
# - update neovim to latest
