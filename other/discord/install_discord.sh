#!/bin/env sh

# Prep for install
echo -e "Preparing for installation\n"
pkill Discord --signal SIGKILL
rm -rfv 'discord.tar.gz' 'Discord/'

# Download and extract
echo -e "\nDownloading and extracting files\n"
wget -vO 'discord.tar.gz' 'https://discord.com/api/download?platform=linux&format=tar.gz' || exit 1
tar -xaf 'discord.tar.gz'

# Modify desktop entry for local install
cat <<EOF > "$HOME/.local/share/applications/discord.desktop"
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that is free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=$HOME/.local/share/Discord/Discord
Icon=discord
Type=Application
Categories=Network;InstantMessaging;
Path=$HOME/.local/bin
EOF

echo -e "\nMoving files\n"
rm -rfv "$HOME/.local/share/Discord/"
mkdir -p "$HOME/.local/share/"
mv -fv 'Discord/' "$HOME/.local/share/"
echo -e "\nInstallation complete!"
