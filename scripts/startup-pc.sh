#!/bin/bash

# Ejecutar inmediatamente
hyprpaper &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

gsettings set org.gnome.desktop.interface cursor-theme "Posy_Cursor_Black"
gsettings set org.gnome.desktop.interface font-name 'Ubuntu Nerd Font Medium'
date > /home/idko/.config/hypr/themechanger.log
/home/idko/Documents/Projects/scripts-and-things/scripts/themeChange/main.sh 2>&1 | tee -a /home/idko/.config/hypr/themechanger.log

# ejecutar después de un rato
sleep 1.5
waybar &

sleep 0.5
wl-paste --watch cliphist store &
flatpak run org.keepassxc.KeePassXC &
"/home/idko/.nvm/versions/node/v20.5.0/bin/node" "/home/idko/Documents/Projects/scripts-and-things/scripts/notifyUpdate.js"
