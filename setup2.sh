#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt purge -y popularity-contest vim-common vim-tiny firefox-esr yelp im-config eog baobab evince totem gnome-characters gnome-contacts gnome-disk-utility gnome-font-viewer gnome-logs gnome-shell-extensions gnome-software gnome-sushi gnome-system-monitor

apt autoremove --purge -y

apt install -y nomacs plymouth plymouth-themes firefox thunderbird mpv qbittorrent gimp git libreoffice-writer libreoffice-impress libreoffice-calc libreoffice-gnome libreoffice-gtk3

plymouth-set-default-theme -R spinner

sudo gedit /etc/network/interfaces
sudo gedit /etc/default/grub

echo "Done!"
