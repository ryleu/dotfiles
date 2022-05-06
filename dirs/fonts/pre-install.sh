#!/bin/bash

firacode_version=$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | jq .id | grep -oE '[^"]+')

[[ -e '.cache/FiraCode.zip.version' ]] && \
[[ $(grep -oE '[0-9]+' '.cache/FiraCode.zip.version') = $firacode_version ]] && \
echo "FiraCode is already up-to-date";exit 0

echo $firacode_version > .cache/FiraCode.zip.version

rm -rf .cache
mkdir -p .cache
echo "Downloading FiraCode Nerd Font"
aria2c -x16 https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -d .cache/ -o FiraCode.zip
echo

echo "Extracting FiraCode Nerd Font"
unzip -u .cache/FiraCode.zip -x "*.ttf" "*Windows*" "Fura*" -d firacode-nf
