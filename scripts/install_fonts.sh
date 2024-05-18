#!/usr/bin/env bash

# Install nerd fonts
if [ -e $HOME/.local/share/fonts/JetBrainsMono ] ; then
	rm -rf $HOME/.local/share/fonts/JetBrainsMono
fi
mkdir -p $HOME/.local/share/fonts/JetBrainsMono &&
cd $HOME/.local/share/fonts/JetBrainsMono &&
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip &&
unzip -q JetBrainsMono.zip &&
rm -rf JetBrainsMono.zip &&
fc-cache -f -v > /dev/null
cd -
