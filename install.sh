#!/bin/bash

style_reset="\e[0m"
style_info="\e[1m"

echo -e "$style_info### INSTALLING: dnf packages ###$style_reset"
sudo dnf install $(cat packages.txt)
echo

echo -e "$style_info### UPDATING: git submodules ###$style_reset"
git submodule update --force
echo

echo -e "$style_info### UPDATING: dotfiles ###$style_reset"
cd "dirs"
bash install.sh
cd ..

echo -e "$style_info### UPDATING: other ###$style_reset"
cd "other"
bash install.sh
cd ..

echo -e "$style_info### UPDATING: dconf ###$style_reset"
dconf load -f / < dconf.conf
echo

echo -e "$style_info### INSTALLATION COMPLETE! ###$style_reset"
echo "You may want to consider restarting and/or logging out and back in. Some changes may not apply properly, otherwise."
echo
