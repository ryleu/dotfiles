#!/bin/bash

rm -rf .cache
mkdir -p .cache
echo "Downloading FiraCode Nerd Font"
aria2c -x16 https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -d .cache/ -o FiraCode.zip
echo

echo "Extracting FiraCode Nerd Font"
unzip -u .cache/FiraCode.zip -x "*.ttf" "*Windows*" "Fura*" -d firacode-nf
