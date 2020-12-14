#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Bunch of aliases
echo "alias i='sudo apt install -y'" >> ~/.bashrc
echo "alias r='sudo apt purge -y'" >> ~/.bashrc
echo "alias l='clear;apt list --installed'" >> ~/.bashrc
echo "" >> ~/.bashrc

echo "alias u='sudo apt update'" >> ~/.bashrc
echo "alias d='sudo apt dist-upgrade -y'" >> ~/.bashrc
echo "alias a='sudo apt autoremove --purge -y'" >> ~/.bashrc
echo "alias c='sudo apt clean'" >> ~/.bashrc
echo "alias udac='u;d;a;c'" >> ~/.bashrc
echo "" >> ~/.bashrc

echo "alias fu='flatpak update -y'" >> ~/.bashrc
echo "alias fi='flatpak install -y'"  >> ~/.bashrc
echo "alias fr='flatpak remove -y --delete-data'"  >> ~/.bashrc
echo "alias fa='flatpak remove -y --unused --delete-data'"  >> ~/.bashrc
echo "alias fl='flatpak list'"  >> ~/.bashrc
echo "alias fudac='fu;fa'"  >> ~/.bashrc
echo "" >> ~/.bashrc

echo "alias gs='git status'" >> ~/.bashrc
echo "alias ga='git add'" >> ~/.bashrc
echo "alias gc='git commit'" >> ~/.bashrc
echo "alias gp='git push'" >> ~/.bashrc
echo "alias g='ga .;gc;gp'" >> ~/.bashrc

# Update to testing - plus nonfree software for drivers
echo "deb http://deb.debian.org/debian testing main contrib non-free" > /etc/apt/sources.list

apt update
apt dist-upgrade -y
apt autoremove --purge -y
apt clean

# Drivers for my desktop
# apt install -y firmware-linux firmware-realtek xorg nvidia-driver

# Drivers for my laptop
# apt install -y firmware-linux firmware-iwlwifi

# Install the desktop
apt install -y plymouth plymouth-themes flatpak gnome-core fonts-noto gedit-plugin-color-picker gedit-plugin-text-size

# Set up plymouth
plymouth-set-default-theme -R spinner

# Set up flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

reboot
