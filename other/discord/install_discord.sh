#!/bin/env sh

rm 'discord.tar.gz'
wget 'https://discord.com/api/download?platform=linux&format=tar.gz' -O 'discord.tar.gz'

tar -xaf 'discord.tar.gz'

mv 'Discord/resources/app.asar' 'Discord/resources/app.asar.bak'
wget -O 'Discord/resources/app.asar' 'https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar'

cat <<EOF > 'Discord/discord.desktop'
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=$HOME/.local/share/discord/Discord
Icon=discord
Type=Application
Categories=Network;InstantMessaging;
Path=$HOME/.local/bin
EOF
#'

rm -rf "~/.local/share/discord/" "~/.local/share/applications/discord.desktop"

mv "Discord/discord.desktop" "~/.local/share/applications/"
mv -f 'Discord/' "~/.local/share/discord/"
