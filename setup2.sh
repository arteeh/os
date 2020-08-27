#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt purge -y popularity-contest vim-common vim-tiny firefox-esr yelp im-config eog baobab evince totem gnome-calculator gnome-characters gnome-contacts gnome-disk-utility gnome-font-viewer gnome-logs gnome-shell-extensions gnome-software gnome-sushi gnome-system-monitor gnome-tweaks

apt autoremove --purge -y

sudo gedit /etc/network/interfaces
sudo gedit /etc/default/grub

update-grub

flatpak install flathub org.gnome.Calculator org.gnome.clocks org.gnome.eog org.gnome.Geary org.gnome.Totem org.gimp.GIMP org.libreoffice.LibreOffice org.qbittorrent.qBittorrent org.mozilla.firefox com.discordapp.Discord com.spotify.Client
