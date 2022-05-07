#!/bin/bash

# figure out where we are
dotfiles_dir=`dirname $(realpath $0)`

# get the dirs with install files to run
dotfiles=`ls -d */ | grep -oE "[^/]+/\$" | tr -d "/"`

for dotfile in $dotfiles
do
	echo -e "$style_info## Setting up dotfiles: $dotfile ##$style_reset"
	
	# make target dir if it doesn't exist
	mkdir -p "/home/$USER/.$dotfile/"

	if [[ -e "$dotfiles_dir/$dotfile/pre-install.sh" ]]; then
		echo "Running pre-setup script"
		echo
		cd "$dotfile"
		bash "pre-install.sh"
		cd ".."
		echo
	fi
	
	# get the dirs to link
	dirs=`ls -d $dotfile/*/ | grep -oE "[^/]+/\$" | tr -d "/"`
	echo "Directories to link: $(echo $dirs | tr '\n' ' ')"
	echo
	
	for d in $dirs
	do
		if [[ -L "/home/$USER/.$dotfile/$d" ]]; then
			echo "Link already exists for $d"
		elif [[ -e "/home/$USER/.$dotfile/$d" ]]; then
			echo "Backing up $d"
			mv -f "/home/$USER/.$dotfile/$d" "/home/$USER/.$dotfile/$d.bak"
			echo "Linking $d"
			ln -s "$dotfiles_dir/$dotfile/$d/" "/home/$USER/.$dotfile/"
		fi
		echo
	done

	if [[ -e "$dotfiles_dir/$dotfile/post-install.sh" ]]; then
		echo "Running post-setup script"
		echo
		cd "$dotfile"
		bash "post-install.sh"
		cd ".."
		echo
	fi
	
	echo "$dotfile setup complete!"
	echo
done
