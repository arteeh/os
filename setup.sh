#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "alias i='sudo apt install -y'" >> .bashrc
echo "alias r='sudo apt purge -y'" >> .bashrc
echo "alias l='clear;apt list --installed'" >> .bashrc
echo "alias u='sudo apt update'" >> .bashrc
echo "alias d='sudo apt dist-upgrade -y'" >> .bashrc
echo "alias a='sudo apt autoremove --purge -y'" >> .bashrc
echo "alias c='sudo apt clean'" >> .bashrc
echo "alias udac='u;d;a;c'" >> .bashrc

echo "deb http://deb.debian.org/debian unstable main contrib non-free" > /etc/apt/sources.list

apt update
apt dist-upgrade -y
apt autoremove --purge -y
apt clean

apt install -y firmware-linux firmware-realtek firmware-iwlwifi gnome-core

reboot