# Variables
export ZSH="$HOME/.config/oh-my-zsh"
export HISTFILE=$HOME/.config/zsh/.zsh_history
export EDITOR=$HOME/.local/bin/nvim
export NNN_USE_EDITOR=1
export PATH="$HOME/.local/bin:$PATH"
export CURSUS="$HOME/Coding/42"
export PROJ="$CURSUS/05-inception/inception"
export PROJ2="$CURSUS/06-ft_transcendence/ft_transcendence"
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

# Aliases
alias c="clear"
alias zshrcs="source $ZDOTDIR/.zshrc"
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
alias conf="$EDITOR $DOTFILES/.config"
alias valf="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all -s"
alias valfrd="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all --suppressions=./leak_readline.supp"
alias cursus="cd $CURSUS"
alias proj="cd $PROJ"
alias proj2="cd $PROJ2"
alias coding="tmuxifier s coding"
alias dots="cd $DOTFILES"
alias py="python3"
alias python="python3"
alias gstt="git status -uno"
alias l="ls -lahH"
unalias tmux # fix 42
# Temp Aliases

# Load tmux
eval "$(tmuxifier init -)"
