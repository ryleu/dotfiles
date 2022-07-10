#!/bin/bash

# figure out where we are
dotfiles_dir=`dirname $(realpath $0)`

echo -e "$style_info## Setting up zsh ##$style_reset"

if [[ -L "$HOME/.zshrc" ]]; then
	echo "Link already exists for .zshrc"
else
	if [[ -e "$HOME/.zshrc" ]]; then
		echo "Backing up current .zshrc"
		mv -f "$HOME/.zshrc" "$HOME/.zshrc.bak"
	fi
	echo "Linking .zshrc"
	ln -s "$dotfiles_dir/zshrc" "$HOME/.zshrc"
fi
echo

echo "zsh setup complete!"
echo
