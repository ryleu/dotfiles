#!/bin/bash

# figure out where we are
dotfiles_dir=$(dirname $(realpath $0))

echo -e "Setting up backup link"

if [[ -L "$HOME/.config/starship.toml" ]]; then
	echo "Backup link already exists"
else
	if [[ -e "$HOME/.config/starship.toml" ]]; then
		echo "Backing up current starship.toml"
		mv -f "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.bak"
	fi
	echo "Creating backup link"
	ln -s "$dotfiles_dir/config.toml" "$HOME/.config/starship.toml"
fi

echo "Starship backup link setup complete!"
