#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Disable built in network so networkmanager can take control
sudo gedit /etc/network/interfaces

# Set up grub to get rid of the boot screen and show plymouth
sudo gedit /etc/default/grub

update-grub

# Get rid of trash
apt purge -y \
	popularity-contest \
	vim-common \
	vim-tiny \
	needrestart \
	malcontent \
	firefox-esr \
	yelp \
	im-config \
	eog \
	baobab \
	evince \
	totem \
	gnome-calculator \
	gnome-characters \
	gnome-contacts \
	gnome-disk-utility \
	gnome-font-viewer \
	gnome-logs \
	gnome-shell-extension* \
	gnome-software \
	gnome-sushi \
	gnome-system-monitor \
	gnome-tweaks

apt autoremove --purge -y

# Get apps
flatpak install flathub -y \
	org.mozilla.firefox \
	org.mozilla.Thunderbird \
	org.gnome.Boxes \
	org.gnome.Calculator \
	org.gnome.Calendar \
	org.gnome.Clocks \
	org.gnome.Contacts \
	org.gnome.Fractal \
	org.gnome.Maps \
	org.gnome.Photos \
	com.github.gi_lom.dialect \
	org.glimpse_editor.Glimpse \
	com.transmissionbt.Transmission \
	com.discordapp.Discord \
	com.microsoft.Teams \
	org.libreoffice.LibreOffice \
	org.gnome.eog \
	org.gnome.Totem
