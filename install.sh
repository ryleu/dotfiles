#!/bin/bash

style_reset="\e[0m"
style_info="\e[1m"

echo -e "$style_info### INSTALLING: RPM fusion ###$style_reset"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
echo 

echo -e "$style_info### INSTALLING: Starship COPR ###$style_reset"
sudo dnf copr enable atim/starship -y
echo

echo -e "$style_info### INSTALLING: Flathub ###$style_reset"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo

echo -e "$style_info### INSTALLING: dnf packages ###$style_reset"
sudo dnf install $(cat packages.txt) -y
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
dconf load -f / < dconf.toml
echo

echo -e "$style_info### INSTALLATION COMPLETE! ###$style_reset"
echo

cat notes.txt
echo
