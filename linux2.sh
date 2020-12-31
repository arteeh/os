#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Set the grub background to black
apt install -y imagemagick
convert -size 1920x1080 xc:black bg.png
cp bg.png /boot/grub/
rm bg.png

# Disable built in network so networkmanager can take control
gedit /etc/network/interfaces

# Set up grub to get rid of the boot screen and show plymouth
gedit /etc/default/grub

touch '/home/arteeh/Templates/Empty file'
chown arteeh '/home/arteeh/Templates/Empty file'
chmod +rw '/home/arteeh/Templates/Empty file'

update-grub

# Get rid of trash
apt purge -y \
	imagemagick \
	termit \
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
	gnome-tweaks \
	system-config-printer

apt autoremove --purge -y

# Get apps
flatpak install flathub -y \
	org.gnome.eog \
	org.gnome.Boxes \
	org.gnome.Epiphany \
	org.gnome.Extensions \
	org.gnome.Totem \
	org.gnome.Geary \
	org.gnome.Calculator \
	org.gnome.Clocks \
	org.gnome.Fractal \
	org.gnome.Characters \
	org.glimpse_editor.Glimpse \
	de.haeckerfelix.Fragments \
	com.discordapp.Discord \
	com.spotify.Client \
	com.microsoft.Teams \
	org.libreoffice.LibreOffice \
	com.uploadedlobster.peek
