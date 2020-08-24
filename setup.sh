#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "alias i='sudo apt install -y'" >> /home/arteeh/.bashrc
echo "alias r='sudo apt purge -y'" >> /home/arteeh/.bashrc
echo "alias l='clear;apt list --installed'" >> /home/arteeh/.bashrc
echo "alias u='sudo apt update'" >> /home/arteeh/.bashrc
echo "alias d='sudo apt dist-upgrade -y'" >> /home/arteeh/.bashrc
echo "alias a='sudo apt autoremove --purge -y'" >> /home/arteeh/.bashrc
echo "alias c='sudo apt clean'" >> /home/arteeh/.bashrc
echo "alias udac='u;d;a;c'" >> /home/arteeh/.bashrc

echo "deb http://deb.debian.org/debian unstable main contrib non-free" > /etc/apt/sources.list

apt update
apt dist-upgrade -y
apt autoremove --purge -y
apt clean

apt install -y firmware-linux firmware-realtek firmware-iwlwifi plymouth plymouth-themes flatpak firefox gnome-core

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

plymouth-set-default-theme -R spinner

reboot
