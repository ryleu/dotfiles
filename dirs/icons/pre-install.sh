#!/bin/bash

echo "Downloading phinger cursors"
[[ -e .phinger ]] && rm -rf .phinger
mkdir .phinger
wget -qcO- https://github.com/phisch/phinger-cursors/releases/latest/download/phinger-cursors-variants.tar.bz2 | tar xfj - -C .phinger
