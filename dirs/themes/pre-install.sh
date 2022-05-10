#!/bin/bash

# TODO: hash check
orchis_install="$(pwd)"
cd .orchis
bash install.sh -d $orchis_install -t default -c dark -s standard -n Orchis-ryleu
cd ..
