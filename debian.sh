#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Bunch of aliases
echo "alias i='sudo apt install -y'" >> /home/arteeh/.bashrc
echo "alias r='sudo apt purge -y'" >> /home/arteeh/.bashrc
echo "alias l='clear;apt list --installed'" >> /home/arteeh/.bashrc
echo "" >> /home/arteeh/.bashrc

echo "alias u='sudo apt update'" >> /home/arteeh/.bashrc
echo "alias d='sudo apt dist-upgrade -y'" >> /home/arteeh/.bashrc
echo "alias a='sudo apt autoremove --purge -y'" >> /home/arteeh/.bashrc
echo "alias c='sudo apt clean'" >> /home/arteeh/.bashrc
echo "alias udac='u;d;a;c'" >> /home/arteeh/.bashrc
echo "" >> /home/arteeh/.bashrc

echo "alias fu='flatpak update -y'" >> /home/arteeh/.bashrc
echo "alias fi='flatpak --user install -y'"  >> /home/arteeh/.bashrc
echo "alias fr='flatpak remove -y --delete-data'"  >> /home/arteeh/.bashrc
echo "alias fa='flatpak remove -y --unused --delete-data'"  >> /home/arteeh/.bashrc
echo "alias fl='flatpak list'"  >> /home/arteeh/.bashrc
echo "alias fufa='fu;fa'"  >> /home/arteeh/.bashrc
echo "" >> /home/arteeh/.bashrc

echo "alias up='udac;fufa'" >> /home/arteeh/.bashrc
echo "" >> /home/arteeh/.bashrc

echo "alias gs='git status'" >> /home/arteeh/.bashrc
echo "alias ga='git add'" >> /home/arteeh/.bashrc
echo "alias gc='git commit'" >> /home/arteeh/.bashrc
echo "alias gp='git push'" >> /home/arteeh/.bashrc
echo "alias g='ga .;gc;gp'" >> /home/arteeh/.bashrc

# Update to testing - plus nonfree software for drivers
echo "deb http://deb.debian.org/debian testing main contrib non-free" > /etc/apt/sources.list

apt update
apt dist-upgrade -y
apt autoremove --purge -y
apt clean

# Drivers for my desktop
# apt install -y firmware-linux firmware-realtek

# Drivers for my laptop
# apt install -y firmware-linux firmware-iwlwifi

# Install the desktop
apt install -y plymouth plymouth-themes flatpak gnome-core fonts-noto gedit-plugin-color-picker gedit-plugin-text-size

# Set up plymouth
plymouth-set-default-theme -R spinner

# Set the grub background to black
apt install -y imagemagick
convert -size 1920x1080 xc:black bg.png
cp bg.png /boot/grub/
rm bg.png

# Set up grub to get rid of the boot screen and show plymouth
sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/g' /etc/default/grub
sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g' /etc/default/grub

update-grub

# Add the empty file template
touch '/home/arteeh/Templates/Empty file'
chown arteeh '/home/arteeh/Templates/Empty file'
chmod +rw '/home/arteeh/Templates/Empty file'

# Disable built in network so networkmanager can take control
nano /etc/network/interfaces

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

# Set up flathub
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# TODO make the system recognize flathub

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
