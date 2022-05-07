#!/bin/bash

# figure out where we are
others_dir=`dirname $(realpath $0)`

# get the dirs with install files to run
others=`ls -d */ | grep -oE "[^/]+/\$" | tr -d "/"`

for other in $others
do
	echo -e "$style_info## Setting up others: $other ##$style_reset"
	
	# make target dir if it doesn't exist
	mkdir -p "/home/$USER/.$other/"

	if [[ -e "$others_dir/$other/install.sh" ]]; then
		echo "Running setup script"
		echo
		cd "$other"
		bash "install.sh"
		cd ".."
		echo
	fi
	
	echo "$other setup complete!"
	echo
done
