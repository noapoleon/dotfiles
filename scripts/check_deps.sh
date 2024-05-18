#!/usr/bin/env bash

deps=("git" "curl" "zsh" "tmux" "nvim" "vim" "stow" "npm" "gcc" "clang" "unzip")
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
printf "All good.\n"
