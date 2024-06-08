#############################
# --- NOA CUSTOM CONFIG --- #
#############################

# Changing default behavior
export ZSH="$HOME/.config/oh-my-zsh"
ZSH_THEME="noapoleon"
export HISTFILE=$HOME/.config/zsh/.zsh_history
source $ZSH/oh-my-zsh.sh
bindkey -v
export EDITOR=$HOME/.local/bin/nvim
export NNN_USE_EDITOR=1
export PATH="$HOME/.local/bin:$PATH"
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Convenience
bak() { # to add: support for multiple files, unbak functionality (needs to check for .bak extension) and protect arguments
	mv "$1" "${1}.bak"
}
alias c="clear"
alias cfg_src="source ~/.config/zsh/.zshrc"
alias cfg_edit="$EDITOR ~/.config/zsh/.zshrc"

### Coding ###
# Debug valgrind
alias valf="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all -s"
alias valfrd="valgrind --track-fds=yes --leak-check=full --track-origins=yes --show-leak-kinds=all --suppressions=./leak_readline.supp"
# 42 Cursus config
export	CURSUS="$HOME/Coding/42"
alias	cursus="cd $CURSUS"
export	PROJ="$CURSUS/06-ft_transcendence/django_test"
alias	proj="cd $PROJ"
alias	coding="tmuxifier s coding"
eval "$(tmuxifier init -)"

#############################
# ---- NOA END CONFIG ----- #
#############################
