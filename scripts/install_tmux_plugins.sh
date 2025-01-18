#!/usr/bin/env bash

### Install tmux plugins
mkdir -p $HOME/.config/tmux/plugins &&
git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
$HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh
git clone https://github.com/jimeh/tmuxifier.git $HOME/.config/tmux/plugins/tmuxifier &&
mkdir -p $HOME/.local/bin
ln -s $HOME/.config/tmux/plugins/tmuxifier/bin/tmuxifier $HOME/.local/bin/tmuxifier
