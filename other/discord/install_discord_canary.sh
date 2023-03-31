#!/bin/env sh

# Prep for install
echo -e "Preparing for installation\n"
pkill Discord --signal SIGKILL
rm -rfv 'discord-canary.tar.gz' 'DiscordCanary/'

# Download and extract
echo -e "\nDownloading and extracting files\n"
wget -vO 'discord-canary.tar.gz' 'https://discord.com/api/download/canary?platform=linux&format=tar.gz' || exit 1
tar -xaf 'discord-canary.tar.gz'

# Download OpenASAR
echo -e "\nDownloading OpenASAR\n"
mv -v 'DiscordCanary/resources/app.asar' 'DiscordCanary/resources/app.asar.original'
wget -vO 'DiscordCanary/resources/app.asar' 'https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar'

# Modify desktop entry for local install
cat <<EOF > "$HOME/.local/share/applications/discord-canary.desktop"
[Desktop Entry]
Name=Discord Canary
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that is free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=$HOME/.local/share/DiscordCanary/DiscordCanary
Icon=discord-canary
Type=Application
Categories=Network;InstantMessaging;
Path=$HOME/.local/bin
EOF

echo -e "\nMoving files\n"
rm -rfv "$HOME/.local/share/DiscordCanary"
mkdir -p "$HOME/.local/share/"
mv -fv 'DiscordCanary/' "$HOME/.local/share/"
echo -e "\nInstallation complete!"
