#!/usr/bin/env bash

PATH_PREFIX=/usr/local

# Get latest release, unzip and install it
if [ -w $PATH_PREFIX ]; then
	rm -rf nvim-linux64.tar.gz nvim-linux64 $PATH_PREFIX/nvim &&
	wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz &&
	tar xzf nvim-linux64.tar.gz
	cp -r nvim-linux64/* $PATH_PREFIX/
	cp -r nvim-linux64/man/* $PATH_PREFIX/man/
	rm -rf nvim-linux64.tar.gz nvim-linux64
else
	printf "Error: no write permission to $PATH_PREFIX\n"
	exit 1
fi

# TO DO:
# - custom install path
# - wget to tmp dir in dotfiles
# - update neovim to latest
