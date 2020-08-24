#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt purge -y popularity-contest vim-common vim-tiny firefox-esr yelp im-config eog baobab evince totem gnome-calculator gnome-characters gnome-contacts gnome-disk-utility gnome-font-viewer gnome-logs gnome-shell-extensions gnome-software gnome-sushi gnome-system-monitor

apt autoremove --purge -y

sudo gedit /etc/network/interfaces
sudo gedit /etc/default/grub

flatpak install flathub org.gnome.Calculator org.gimp.GIMP io.github.celluloid_player.Celluloid org.gnome.eog org.libreoffice.LibreOffice org.qbittorrent.qBittorrent org.mozilla.Thunderbird
