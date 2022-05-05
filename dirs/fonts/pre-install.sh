#!/bin/bash

rm -rf .cache
mkdir -p .cache
aria2c -x16 -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -d .cache/ -o FiraCode.zip
unzip -uq .cache/FiraCode.zip -x "*.ttf" "*Windows*" "Fura*" -d firacode-nf
