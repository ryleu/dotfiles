#!/bin/bash

echo "Applying config for flatpak"

for i in fonts themes icons
do
	echo "Adding filesystem overrides for ~/.$i/"
	flatpak override --user --filesystem=~/.$i/:ro
	echo "Adding filesystem overrides for /usr/share/$i/"
	flatpak override --user --filesystem=/usr/share/$i/:ro
done

echo
