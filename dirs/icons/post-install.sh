#!/bin/bash

icons="Papirus-Dark"
cursor="phinger-cursors"

echo "Setting icons to $icons"
gsettings set org.gnome.desktop.interface icon-theme $icons
echo "Setting cursor to $cursor"
gsettings set org.gnome.desktop.interface cursor-theme $cursor
