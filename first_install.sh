#!/bin/bash

style_reset="\e[0m"
style_info="\e[1m"

echo -e "$style_info### INSTALLING: RPM fusion ###$style_reset"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo 

echo -e "$style_info### INSTALLING: Flathub ###$style_reset"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo

echo -e "$style_info### SETTING UP: Configuring submodules ###$style_reset"
git submodule update --init

./install.sh
