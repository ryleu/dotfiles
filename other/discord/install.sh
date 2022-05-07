#!/bin/bash

for v in discord discordcanary
do
	echo "Applying config for $v"

	mkdir -p ~/.config/$v

	if [[ -e ~/.config/$v/settings.json ]]; then
		python3 setmin.py ~/.config/$v/settings.json
	else
		echo '{"MIN_WIDTH":0,"MIN_HEIGHT":0}' > ~/.config/$v/settings.json
	fi
done
