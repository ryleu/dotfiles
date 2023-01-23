#!/bin/env sh

pkill Discord --signal SIGKILL

rm -rfv 'discord-canary.tar.gz' 'DiscordCanary/' "$HOME/.local/share/discord-canary/" "$HOME/.local/share/applications/discord-canary.desktop"

wget -vO 'discord-canary.tar.gz' 'https://discord.com/api/download/canary?platform=linux&format=tar.gz'

tar -xaf 'discord-canary.tar.gz'

mv -v 'DiscordCanary/resources/app.asar' 'DiscordCanary/resources/app.asar.bak'
wget -vO 'DiscordCanary/resources/app.asar' 'https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar'

cat <<EOF > "$HOME/.local/share/applications/discord-canary.desktop"
[Desktop Entry]
Name=Discord Canary
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that is free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=$HOME/.local/share/discord-canary/DiscordCanary
Icon=discord-canary
Type=Application
Categories=Network;InstantMessaging;
Path=$HOME/.local/bin
EOF

mv -fv 'DiscordCanary/' "$HOME/.local/share/discord-canary/"
