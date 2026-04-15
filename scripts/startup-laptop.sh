#!/bin/bash

# Ejecutar inmediatamente
hyprpaper &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

gsettings set org.gnome.desktop.interface cursor-theme "Posy_Cursor_125_175"
gsettings set org.gnome.desktop.interface font-name 'Inter Medium'
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
hyprctl setcursor Posy_Cursor_125_175 32

# ejecutar después de un rato
sleep 1.5
waybar &

sleep 1
wl-paste --watch cliphist store &

sleep 0.2
nm-applet &

sleep 0.2
blueman-applet &

sleep 0.2
flatpak run org.keepassxc.KeePassXC &

sleep 0.2
batsignal -b -m +40 -w 18 -c 10 -d 5 -D "/usr/bin/systemctl hibernate"

sleep 0.2
"/home/idko/.nvm/versions/node/v23.6.0/bin/node" "/home/idko/Documents/Projects/scripts-and-things/scripts/notifyUpdate.js"

sleep 0.2
hypridle &
