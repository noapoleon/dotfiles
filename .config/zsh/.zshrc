# Variables
export ZSH="$HOME/.config/oh-my-zsh"
export HISTFILE=$HOME/.config/zsh/.zsh_history
export EDITOR=$HOME/.local/bin/nvim
export NNN_USE_EDITOR=1
export PATH="$HOME/.local/bin:$PATH"
export CURSUS="$HOME/Coding/42"
export PROJ="$CURSUS/06-ft_transcendence/django_test"
export DOTFILES="$HOME/Dotfiles"

# Select custom theme
ZSH_THEME="noapoleon"

# Plugins
plugins=(git)

# sourcing oh-my-zsh config
source $ZSH/oh-my-zsh.sh

# Configure vim mode
bindkey -v
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Functions (move to file)
bak() {
	# to add:
	# - support for multiple files
	# - backup to directory
	# - backup to archive (tar.gz or zip)
	# - unbak, removes back extension
	mv "$1" "${1}.bak"
}

# Aliases
alias c="clear"
alias zshrc_source="source $ZDOTDIR/.zshrc"
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
alias conf="$EDITOR $DOTFILES"
alias valf="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all -s"
alias valfrd="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all --suppressions=./leak_readline.supp"
alias cursus="cd $CURSUS"
alias proj="cd $PROJ"
alias coding="tmuxifier s coding"
alias dots="cd $DOTFILES"

# Load tmux
eval "$(tmuxifier init -)"
