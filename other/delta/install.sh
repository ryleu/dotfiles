#!/bin/bash

# figure out where we are
dotfiles_dir=`dirname $(realpath $0)`

echo -e "$style_info## Setting up Git ##$style_reset"

if [[ -L "$HOME/.gitconfig" ]]; then
	echo "Link already exists for .gitconfig"
else
	if [[ -e "$HOME/.gitconfig" ]]; then
		echo "Backing up current .gitconfig"
		mv -f "$HOME/.gitconfig" "$HOME/.gitconfig.bak"
	fi
	echo "Linking .gitconfig"
	ln -s "$dotfiles_dir/gitconfig" "$HOME/.gitconfig"
fi
