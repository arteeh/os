#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Get rid of trash
apt purge -y popularity-contest vim-common vim-tiny firefox-esr yelp im-config eog baobab evince totem gnome-calculator gnome-characters gnome-contacts gnome-disk-utility gnome-font-viewer gnome-logs gnome-shell-extension* gnome-software gnome-sushi gnome-system-monitor gnome-tweaks
apt autoremove --purge -y

# Fix network so networkmanager can take control
sudo gedit /etc/network/interfaces

# Fix grub to get rid of boot screen and show plymouth
sudo gedit /etc/default/grub
update-grub

# Get my apps
flatpak install flathub -y org.gnome.Calculator org.gnome.Clocks org.gnome.Contacts org.gnome.Calendar org.gnome.eog org.gnome.Totem org.gnome.Boxes org.gnome.Maps
flatpak install flathub -y org.mozilla.firefox org.mozilla.Thunderbird org.glimpse_editor.Glimpse org.libreoffice.LibreOffice com.transmissionbt.Transmission com.discordapp.Discord org.signal.Signal com.microsoft.Teams
