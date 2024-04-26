#!/bin/bash

exit #not ready yet

# COLORS
COL_GREEN="\033[32m"
COL_BLUE="\033[34m"
COL_ERR="\033[31m"
COL_WRN="\033[33m"
COL_RST="\033[0m"

# Get script absolute path
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

function halt_install() {
	printf "\n${COL_WRN}Halting installation...${COL_WRN}\n"
	exit 1
}

### Main install start!!!
printf "${COL_GREEN}[ Installing Noapoleon dotfiles... ]${COL_RST}\n\n"

# Stop if HOME variable doesn't exists
if [[ -z "$HOME" ]]; then
	printf "${COL_ERR}Error:${COL_RST} Home directory not set, cannot proceed with installation\n"
	halt_install
fi

# Checking dependencies
printf "${COL_BLUE}[ Checking dependencies ]${COL_RST}\n"
deps=("git" "curl" "zsh"
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

exit
# Backup current config
printf "${COL_BLUE}[ Backing up configs ]${COL_RST}\n"
backup_dir=$HOME/.dotfiles.pre-noastreos.bak/backup_$(date +"%Yy%mm%dd_%Hh%Mm%Ss")
printf "Creating backup directory: $backup_dir"
if ! mkdir -p $backup_dir; then
	printf "${COL_ERR}Error:${COL_RST} Failed to create backup directory\n"
	halt_install
fi
configs=("tmux" "nvim")
for str in "${deps[@]}" ; do
	if -d $HOME/.config/${str} ; then
		if ! cp -r $HOME/.config/${str} ${backup_dir}/.config; then
	fi
done
# copy zshrc

# Install tmux plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
sh $HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh
git clone https://github.com/jimeh/tmuxifier.git $HOME/.config/tmux/plugins/tmuxifier
ln -s $HOME/.config/tmux/plugins/tmuxifier/bin/tmuxifier $HOME/.local/bin/tmuxifier

# Install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Check if existence of oh-my-zsh folder prevents installation
# because noapoleon theme needs to be copied into its theme folder
# otherwise the .zshrc will have an error when requesting the noapoleon theme

### Future Additions ###
# 
# - backup directory option: ./install -backup=<dir>
# - font installation and fc-cache thing
