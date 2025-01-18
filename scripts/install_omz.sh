#!/usr/bin/env bash

# Install oh-my-zsh
printf "${COL_SECTION}[ --- Installing oh-my-zsh --- ]${COL_RST}\n"
export ZSH="$HOME/.config/oh-my-zsh" 
if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed '/exec zsh/d')" "" --keep-zshrc ; then
	printf "${COL_ERR}Error:${COL_RST} Failed\n"
	halt_install
fi
