#!/bin/bash

firacode_version=$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | jq .id | grep -oE '[^"]+')

# check if we already have the latest version

# does the version file exist?
if [[ -e '.cache/FiraCode.zip.version' ]]; then
	# is the version the same as the latest version?
	if [[ $(grep -oE '[0-9]+' '.cache/FiraCode.zip.version') = $firacode_version ]]; then
		echo "FiraCode is already up-to-date"
		exit 0
	fi
fi

# remove the current downloaded (outdated) version
rm -rf .cache
mkdir -p .cache

# download the latest version
echo "Downloading FiraCode Nerd Font"
aria2c -x16 https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -d .cache/ -o FiraCode.zip
echo

# save the version we downloaded
echo $firacode_version > .cache/FiraCode.zip.version

# extract the files we want from it
echo "Extracting FiraCode Nerd Font"
unzip -u .cache/FiraCode.zip -x "*.ttf" "*Windows*" "Fura*" -d firacode-nf
