#!/bin/bash

adw_json=$(curl -s "https://api.github.com/repos/lassekongo83/adw-gtk3/releases/latest")
adw_version=$(echo $adw_json | jq -r ".id")
adw_download_url=$(echo $adw_json | jq -r ".assets|.[0]|.browser_download_url")

# check if we already have the latest version

# does the version file exist?
if [[ -e ".cache/adw.tar.xz.version" ]]; then
	# is the version the same as the latest version?
	if [[ $(grep -oE "[0-9]+" ".cache/adw.tar.xz.version") = $adw_version ]]; then
		echo "adw-gtk3 is already up-to-date"
		exit 0
	fi
fi

# remove the current downloaded (outdated) version
rm -rf .cache
mkdir -p .cache

# download the latest version
echo "Downloading adw-gtk3 theme"
aria2c -x16 $adw_download_url -d ".cache/" -o "adw3.tar.xz"
echo

# save the version we downloaded
echo $adw_version > ".cache/adw3.tar.xz.version"

# extract it
echo "Extracting adw-gtk3"
tar -xf ".cache/adw3.tar.xz"
