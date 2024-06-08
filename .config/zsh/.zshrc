# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load init
source "${ZINIT_HOME}/zinit.zsh"

# Variables
export TERM="xterm-256color"
export EDITOR="$HOME/.local/bin/nvim"
export PATH="$HOME/.local/bin:$PATH"
export CURSUS="$HOME/Coding/42"
export PROJ="$CURSUS/06-ft_transcendence/django_test"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
#zinit snippet OMZP::archlinux
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
#zinit snippet OMZP::command-not-found
# Add in snippets (noapoleon)
#zinit snippet OMZP::docker # produces error with tee
zinit snippet OMZP::systemd
zinit snippet OMZP::tmux
zinit snippet OMZP::tmuxinator
zinit snippet OMZP::command-not-found
zinit snippet OMZP::common-aliases


# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/zen.toml)"

# Keybindings
bindkey -e # try going back to vim
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
autoload -z edit-command-line		# 
zle -N edit-command-line			# Edit command in editor
bindkey "^X^E" edit-command-line	# 


# History
HISTSIZE=10000
HISTFILE=$HOME/.config/zsh/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # doesn't seem to work
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias c='clear'
alias source_zshrc='source $ZDOTDIR/.zshrc' # make a prompt save version of zshrc alias command with && read [Y/n] && source
alias cursus="cd $CURSUS"
alias proj="cd $PROJ"
alias conf="$EDITOR $HOME/.config/"

# Shell integrations
eval "$(fzf --zsh)"
