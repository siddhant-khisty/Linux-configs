#!/bin/bash
#
# This script is meant to be a post-install step after installing arch
# either manually or using the arch install script.
#
# This particular script is set for my use case and my system. If you intended to use this on your PC, please go through this script first and make sure everything is to your liking.
#
# I will be using Hyprland as my desktop environment, along with ly as my
# display Manager
#
# Below is a list of all the packages I will be using. If you want to know what a particular package does feel free to google it:
#
# hyperland
# kitty
# waybar-hyprland
# swaybg
# swaylock-effects
# wofi
# wlogout
# mako
# thunar
# ttf-hetbrains-mono-nerd
# noto-fonts-emoji
# polkit-gnome
# python-requests
# starship
# swappy
# grim
# slurp
# pamixer
# brightnessctl
# gvfs
# bluez
# bluez-utils
# lxappearance
# xfce4-settings
# xdg-desktop-portal-hyprland-git
# balena-etcher
# discord
# firefox
# google-chrome
# obs-studio
# xdman
# telegram-desktop
# slack
# coreimage
# vlc
# ly
# batsignal

### Install git and yay
sudo pacman -S --noconfirm git
git clone https://aur.archlinux.org/yay.git
cd yay 
makepkg -si

### Install AUR packages###
echo -e "Installing AUR packages"
yay -S --noconfirm kitty waybar-hyprland \
	swaylock-effects wlogout \
	xdg-desktop-portal-hyprland-git balena-etcher \
        slack-desktop xdman google-chrome coreimage ly \ 
	batsignal visual-studio-code-bin 
### Install packages with pacman
echo -e "Installing pacman packages"

sudo pacman -S --noconfirm hyprland mako swaybg wofi kitty discord firefox  \
                noto-fonts-emoji obs-studio vlc telegram-desktop thunar ttf-jetbrains-mono-nerd \
		noto-fonts-emoji polkit-gnome python-requests swappy grim slurp \
  		pamixer brightnessctl gvfs bluez bluez-utils lxapperance xfce4-settings \
		
  		
		

### Install and start bluetooth and Network manager services
sudo pacman --noconfirm bluez bluez-util networkmanager
echo -e "starting bluetooh.servcie"
sudo systemctl enable --now bluetooth.service
sleep 2

echo -e "Starting Network Manager"
sudo systemctl enable --now NetworkManager.service

### Starting batsignal

systemctl enable --now --user batsignal.service

### Enable ly
echo -e "Starting ly Display manager"
sudo systemctl enable --now ly.service

### Copying config files
echo -e "Copying config files to ~/.config"

    cp -R config ~/.config

### Copying themes to ~/.themes

cp -R themes ~/.themes

### Copying user configuration files to /usr/share

sudo cp -R usr /usr

### Set some files as executables
chmod +x ~/.config/hypr/xdg-portal-hyprland
chmod +x ~/.config/waybar/scripts/waybar-wttr.py
