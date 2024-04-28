#!/bin/bash

# Colors
COL_GREEN="\033[32m"
COL_BLUE="\033[34m"
# Named Colors
COL_START="\033[32;7;1m"
COL_SECTION="\033[34;4;1m"
COL_ERR="\033[31;1m"
COL_WRN="\033[33;1m"
COL_INFO="\033[33;3;1m"
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
	printf "\n${COL_WRN}Halting installation...${COL_WRN}\n"
	exit 1
}

### Main install start!!!
printf "${COL_START}[ Installing Noapoleon dotfiles... ]${COL_RST}\n\n"

# Stop if HOME variable doesn't exists
if [[ -z "$HOME" ]]; then
	printf "${COL_ERR}Error:${COL_RST} Home directory not set, cannot proceed with installation\n"
	halt_install
fi

# Checking dependencies
printf "${COL_SECTION}[ Checking dependencies ]${COL_RST}\n"
deps=("git" "curl" "zsh" "tmux")
has_all_deps=true
for str in "${deps[@]}" ; do
	if ! command -v ${str} > /dev/null ; then
		if [[ $has_all_deps = true ]]; then
			has_all_deps=false
			printf "${COL_ERR}Error:${COL_RST} Unmet dependencies, please install the following:\n"
		fi
		printf " ${COL_ERR}-${COL_RST} ${str}\n"
	fi
done
if [[ $has_all_deps = false ]]; then
	halt_install
fi
printf "Done.\n"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed '/exec zsh -l')" "" --keep-zshrc

# Backup current config
printf "${COL_SECTION}[ Installing configs ]${COL_RST}\n"
backup_dir=$HOME/.dotfiles.pre-noastreos.bak/backup_$(date +"%Yy%mm%dd_%Hh%Mm%Ss")
function install_config() {
	if [[ $# -ne 1 || $1 == "" ]]; then
		print "${COL_ERROR}[Error]:${COL_RST} Not enough arguments for backup"
		halt_install
	fi
	if [[ -e $HOME/$1 ]] ; then
		if ! [[ mkdir -p $(dirname $backup_dir/$1) && cp -r $HOME/$1 $backup_dir/$1 ]] ; then
			printf "${COL_ERR}Error:${COL_RST} Failed to backup ${HOME}/$1 to $backup_dir/$1\n"
			halt_install
		fi
	fi
	if ! [[ rm -rf $HOME/$1 && cp -r $1 $HOME/$1 ]] ; then
		printf "${COL_ERR}Error:${COL_RST} Failed to install $1  in $HOME/$1\n"
		# attempt to reinstall previous configs with backups? it's 6am not now
		halt_install
	fi
	printf "Installed $HOME/$1"
}
if ! mkdir -p $backup_dir; then
	printf "${COL_ERR}Error:${COL_RST} Failed to create backup directory $backup_dir\n"
	halt_install
else
	printf "${COL_INFO}Backup directory:${COL_RST} $backup_dir\n"
fi
# XDG Configs
configs=("tmux" "nvim" "oh-my-zsh")
for str in "${configs[@]}" ; do
	install_config .config/$str 
done
# Other Configs
install_config .zshrc

### Install tmux plugins
mkdir -p $HOME/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
sh $HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh
git clone https://github.com/jimeh/tmuxifier.git $HOME/.config/tmux/plugins/tmuxifier
mkdir -p $HOME/.local/bin
ln -s $HOME/.config/tmux/plugins/tmuxifier/bin/tmuxifier $HOME/.local/bin/tmuxifier

# Go in zsh
exec zsh -l

### Future Additions ###
# 
# - backup directory option: ./install -backup=<dir>
# - font installation and fc-cache thing
