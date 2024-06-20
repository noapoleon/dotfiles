#!/usr/bin/env bash

deps=("git" \
	"wget" \
	"curl" \
	"zsh" \
	"fuse" \
	"tmux" \
	"nvim" \
	"vim" \
	"stow" \
	"npm" \
	"gcc" \
	"clang" \
	"unzip" \
	"ripgrep" \
	"python3" \
	"python3-pip" \
	"python3-pipenv" \
	"docker" \
	"fzf"
	"man"
	"build-essential")

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
if [[ $has_all_deps = true ]]; then
	printf "All good.\n"
fi
