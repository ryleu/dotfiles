#!/bin/env sh

pkill Discord --signal SIGKILL

rm -rf 'discord.tar.gz' 'Discord/' "~/.local/share/discord/" "~/.local/share/applications/discord.desktop"
wget 'https://discord.com/api/download?platform=linux&format=tar.gz' -O 'discord.tar.gz'

tar -xaf 'discord.tar.gz'

mv 'Discord/resources/app.asar' 'Discord/resources/app.asar.bak'
wget -O 'Discord/resources/app.asar' 'https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar'

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

mv -f 'Discord/' "$HOME/.local/share/discord/"
