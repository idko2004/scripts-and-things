#!/bin/bash

# Ejecutar inmediatamente
hyprpaper &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

gsettings set org.gnome.desktop.interface cursor-theme "Posy_Cursor_125_175"
gsettings set org.gnome.desktop.interface font-name 'Inter Medium'
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
hyprctl setcursor Posy_Cursor_125_175 24

# ejecutar después de un rato
sleep 1.5
waybar &
hypridle &

sleep 0.5
wl-paste --watch cliphist store &
nm-applet &
blueman-applet &
flatpak run org.keepassxc.KeePassXC &

sleep 0.5
batsignal -w 18 -c 10 -d 5 -D "/usr/bin/systemctl hibernate" &
"/home/idko/.nvm/versions/node/v20.5.0/bin/node" "/home/idko/Documents/Projects/scripts-and-things/scripts/notifyUpdate.js"
