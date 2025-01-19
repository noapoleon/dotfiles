# Variables
export ZSH="$HOME/.config/oh-my-zsh"
export HISTFILE=$HOME/.config/zsh/.zsh_history
export EDITOR=$HOME/.local/bin/nvim
export NNN_USE_EDITOR=1
export DOTFILES="$HOME/Dotfiles"
export VIRTUAL_ENV_DISABLE_PROMPT="yes"
export ZSH_CUSTOM="$ZDOTDIR/custom"

# XDG setup
# Doc: https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
# XDG manual homes
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

# PATH management (zsh's `path` array is synced with PATH)
path=(
	"$HOME/.local/bin/"
	$path
)
export PATH

# Select custom theme
ZSH_THEME="noapoleon"

# Plugins
plugins=(zsh-interactive-cd git systemd tmux)

# sourcing oh-my-zsh config
source $ZSH/oh-my-zsh.sh

## Configure vim mode
bindkey -v
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# emacs mode
#bindkey -e
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
	web			"/etc/nginx/sites-available/default"
)
for key value in ${(@kv)configs}; do
	if [[ $key == "zsh" ]]; then
		alias ${key}_conf="$EDITOR $value && source $value && printf \"$configs[zsh] has been sourced\n\""
		alias conf_${key}=${key}_conf
	elif [[ $key == "web" ]]; then
		alias ${key}_conf="sudo vim /etc/nginx/sites-available/default && sudo nginx -s reload"
		alias conf_${key}=${key}_conf
	else
		alias ${key}_conf="$EDITOR $value"
		alias conf_${key}=${key}_conf
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
	ft_transcendence	"$( [[ $LOCATION == "42" ]] && printf "$HOME/goinfre/ft_transcendence" || printf "$CURSUS/06-ft_transcendence/ft_transcendence")"
	inception			"$( [[ $LOCATION == "42" ]] && printf "$HOME/goinfre/inception" || printf "$CURSUS/05-inception/inception")"
	libft				"$CURSUS/00-libft/libft"
  	python      "$CURSUS/piscine_python/python01"
)
# make fzf interactive menu instead of aliases
for key value in ${(@kv)projects}; do
	alias proj_$key="cd $value" # add $EDITOR prompt with read [Y\n] thingy`
done
# Current project
alias proj=proj_python
#alias proj2=proj_transcendence


# Aliases
alias c="clear -x"
alias valf="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all -s"
alias valfrd="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all --suppressions=./leak_readline.supp"
alias coding="tmuxifier s coding"
alias py="python3"
alias python="python3"
alias gstt="git status -uno"
alias l="ls -lahH"
alias pipenv_purge="rm -rf $HOME/.local/share/virtualenvs/*"
alias bat="batcat"
alias source_zshrc="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias web="cd /var/www/html"
alias webtest="cd /var/www/test"
#alias web3="cd /var/www/w3"
alias wimi="curl -4 ifconfig.me"
alias wimi4="curl -4 ifconfig.me"
alias wimi6="curl -6 ifconfig.me"

# Python setup
if ! type pyenv > /dev/null; then
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi
alias norminette=flake8

# Load tmux
eval "$(tmuxifier init -)"
