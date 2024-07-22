# Variables
export ZSH="$HOME/.config/oh-my-zsh"
export HISTFILE=$HOME/.config/zsh/.zsh_history
export EDITOR=$HOME/.local/bin/nvim
export NNN_USE_EDITOR=1
export PATH="$HOME/.local/bin:$PATH"
export DOTFILES="$HOME/Dotfiles"
export VIRTUAL_ENV_DISABLE_PROMPT="yes"
export ZSH_CUSTOM="$ZDOTDIR/custom"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Select custom theme
ZSH_THEME="noapoleon"

# Plugins
plugins=(zsh-interactive-cd git systemd tmux)

# sourcing oh-my-zsh config
source $ZSH/oh-my-zsh.sh

## Configure vim mode
##bindkey -M vicmd "k" up-line-or-beginning-search
##bindkey -M vicmd "j" down-line-or-beginning-search

# emacs mode
bindkey -e
# History settings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Functions (move to file)
bak() {
	# to add:
	# - support for multiple files
	# - backup to directory
	# - backup to archive (tar.gz or zip)
	# - unbak, removes back extension
	mv "$1" "${1}.bak"
}
# Config management
alias dots="cd $DOTFILES"
declare -x -A configs
configs=(
	nvim		"$XDG_CONFIG_HOME/nvim"
	tmux		"$XDG_CONFIG_HOME/tmux/tmux.conf"
	terminator	"$XDG_CONFIG_HOME/terminator"
	zsh			"$XDG_CONFIG_HOME/zsh/.zshrc"
	omz			"$XDG_CONFIG_HOME/oh-my-zsh"
)
for key value in ${(@kv)configs}; do
	if [[ $key == "zsh" ]]; then
		alias conf_$key="$EDITOR $value && source $value && printf \"$configs[zsh] has been sourced\n\""
	else
		alias conf_$key="$EDITOR $value"
	fi
done

# Location setting
if [ -d /sgoinfre ]; then
	export LOCATION="42"
else
	export LOCATION="home"
fi
if [[ $LOCATION == "42" ]]; then
	unalias tmux
	if ! [[ -L $HOME/media ]]; then
		ln -s /media/nlegrand $HOME/media
	fi
fi
# Project management
export CURSUS="$HOME/Coding/42"
alias cursus="cd $CURSUS"
declare -x -A projects
projects=(
	trans		"$( [[ $LOCATION == "42" ]] && printf "$HOME/goinfre/ft_transcendence" || printf "$CURSUS/06-ft_transcendence/ft_transcendence")"
	inception	"$( [[ $LOCATION == "42" ]] && printf "$HOME/goinfre/inception" || printf "$CURSUS/05-inception/inception")"
	libft		"$CURSUS/00-libft/libft"
)
# make fzf interactive menu instead of aliases
for key value in ${(@kv)projects}; do
	alias proj_$key="cd $value" # add $EDITOR prompt with read [Y\n] thingy`
done
# Current project
alias proj=proj_trans


# Aliases
alias c="clear"
alias valf="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all -s"
alias valfrd="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all --suppressions=./leak_readline.supp"
alias coding="tmuxifier s coding"
alias py="python3"
alias python="python3"
alias gstt="git status -uno"
alias l="ls -lahH"
alias pipenv_purge="rm -rf $HOME/.local/share/virtualenvs/*"
alias bat="batcat"

# Load tmux
eval "$(tmuxifier init -)"
