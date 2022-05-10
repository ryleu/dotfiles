#!/bin/bash

if [[ ! -e '/usr/share/discord-canary/resources/build_info.json' ]]; then
	echo 'Discord Canary is not installed.'
	exit 0
fi

installed_canary_version=$(jq .version '/usr/share/discord-canary/resources/build_info.json' | grep -oE '[^"]+')
latest_canary_version=$(curl -sI 'https://discord.com/api/download/canary?platform=linux&format=tar.gz' | sed -E -n '/location:/{s/^.+linux\/// ; s/\/.+$//p}')

if [[ ! $installed_canary_version = $latest_canary_version ]]; then
	echo "Discord Canary is not up-to-date"
else
	echo "Discord Canary is up-to-date"
fi

echo "Applying config for Discord Canary. The process will be killed if it is running"
killall DiscordCanary

mkdir -p ~/.config/discordcanary

if [[ -e ~/.config/discordcanary/settings.json ]]; then
	python3 setmin.py ~/.config/discordcanary/settings.json
else
	echo '{"MIN_WIDTH":0,"MIN_HEIGHT":0}' > ~/.config/discordcanary/settings.json
fi
