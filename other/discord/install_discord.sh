#!/bin/env sh

pkill Discord --signal SIGKILL

rm -rfv 'discord.tar.gz' 'Discord/' "$HOME/.local/share/discord/" "$HOME/.local/share/applications/discord.desktop"

wget -vO 'discord.tar.gz' 'https://discord.com/api/download?platform=linux&format=tar.gz'

tar -xaf 'discord.tar.gz'

mv -v 'Discord/resources/app.asar' 'Discord/resources/app.asar.bak'
wget -vO 'Discord/resources/app.asar' 'https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar'

cat <<EOF > "$HOME/.local/share/applications/discord.desktop"
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that is free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=$HOME/.local/share/discord/Discord
Icon=discord
Type=Application
Categories=Network;InstantMessaging;
Path=$HOME/.local/bin
EOF

mkdir -p "$HOME/.local/share/discord"

mv -fv 'Discord/' "$HOME/.local/share/discord/"
