#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Bunch of aliases
echo "alias i='sudo apt install -y'" >> /home/arteeh/.bashrc
echo "alias r='sudo apt purge -y'" >> /home/arteeh/.bashrc
echo "alias l='clear;apt list --installed'" >> /home/arteeh/.bashrc

echo "alias u='sudo apt update'" >> /home/arteeh/.bashrc
echo "alias d='sudo apt dist-upgrade -y'" >> /home/arteeh/.bashrc
echo "alias a='sudo apt autoremove --purge -y'" >> /home/arteeh/.bashrc
echo "alias c='sudo apt clean'" >> /home/arteeh/.bashrc
echo "alias udac='u;d;a;c'" >> /home/arteeh/.bashrc

echo "alias fu='flatpak update -y'" >> /home/arteeh/.bashrc
echo "alias fi='flatpak install -y'"  >> /home/arteeh/.bashrc
echo "alias fr='flatpak remove -y'"  >> /home/arteeh/.bashrc
echo "alias fa='flatpak remove -y --unused'"  >> /home/arteeh/.bashrc
echo "alias fl='flatpak list'"  >> /home/arteeh/.bashrc
echo "alias fudac='fu;fa'"  >> /home/arteeh/.bashrc

echo "alias g='git add .;git commit;git push'" >> /home/arteeh/.bashrc

# Update to testing
echo "deb http://deb.debian.org/debian testing main contrib non-free" > /etc/apt/sources.list

apt update
apt dist-upgrade -y
apt autoremove --purge -y
apt clean

# Install firmware and desktop
apt install -y firmware-linux firmware-iwlwifi firmware-realtek plymouth plymouth-themes flatpak gnome-core

# Set up plymouth
plymouth-set-default-theme -R spinner

# Set up flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

reboot
