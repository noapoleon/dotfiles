#!/bin/bash

# Named Colors
COL_HEADER="\033[32;7m"
COL_START="\033[32m"
COL_SECTION="\033[34m"
COL_ERR="\033[31m"
COL_WRN="\033[33m"
COL_INFO="\033[33m"
COL_RST="\033[0m"

# Get script absolute path
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
# Helper function
function halt_install() {
	printf "\n${COL_WRN}Halting installation...${COL_RST}\n"
	exit 1
}

# Install warnings and prompt
printf "\n${COL_START}[ ### oapoleon Dotfiles Install Utility ### ]${COL_RST}\n\n"

# Stop if HOME variable doesn't exists
if [[ -z "$HOME" ]]; then
	printf "${COL_ERR}Error:${COL_RST} HOME directory not set, cannot proceed with installation\n"
	halt_install
fi

# Checking dependencies
printf "${COL_SECTION}[ --- Checking dependencies --- ]${COL_RST}\n"
sh scripts/check_deps.sh

# Stow
printf "${COL_SECTION}[ --- Stowing dotfiles --- ]${COL_RST}\n"
if ! stow . ; then
	printf "${COL_ERR}Error:${COL_RST} Stow failed to deploy symlinks because of conflicts. Resolve them and try again.\n"
	halt_install
fi

# Install oh-my-zsh
printf "${COL_SECTION}[ --- Installing oh-my-zsh --- ]${COL_RST}\n"
export ZSH="$HOME/.config/oh-my-zsh" 
if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed '/exec zsh/d')" "" --keep-zshrc ; then
	printf "${COL_ERR}Error:${COL_RST} Failed\n"
	halt_install
fi

### Install tmux plugins
mkdir -p $HOME/.config/tmux/plugins &&
git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
$HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh
git clone https://github.com/jimeh/tmuxifier.git $HOME/.config/tmux/plugins/tmuxifier &&
mkdir -p $HOME/.local/bin
ln -s $HOME/.config/tmux/plugins/tmuxifier/bin/tmuxifier $HOME/.local/bin/tmuxifier

# Goodbye
printf "\n${COL_START}[ ### Noapoleon dotfiles installed ### ]${COL_RST}\n\n"

# Go in zsh
exec zsh -l

### Future Additions ###
# 
# - backup directory option: ./install -backup=<dir>
# - install neovim locally in .local/bin
# - more error detection and messages
# - copy tmuxifier session layout for coding
# - break up script install multiple smaller ones that can be called individually
