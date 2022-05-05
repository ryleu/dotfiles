#!/bin/bash

theme="Orchis-dark-ryleu"

echo "Setting application theme to $theme"
gsettings set org.gnome.desktop.interface gtk-theme $theme
echo "Setting shell theme to $theme"
gsettings set org.gnome.shell.extensions.user-theme name $theme
