#!/bin/bash

# figure out where we are
dotfiles_dir=$(dirname $(realpath $0))

# get the dirs with install files to run
dotfiles=$(ls -d */ | grep -oE "[^/]+/\$" | tr -d "/")

for dotfile in $dotfiles
do
	if [[ -e "$dotfiles_dir/$dotfile/install.sh" ]]; then
		echo "Running setup script"
		echo
		cd "$dotfile"
		bash "install.sh"
		cd ".."
		echo
	fi
done
