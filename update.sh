#!/bin/bash

if ! command -v figlet >/dev/null
then
    echo "Figlet no está instalado"
    exit 1
fi

figlet Sudo password
sudo echo ":)"

if command -v paru >/dev/null
then
	figlet Paru
	notify-send "Paru update" "Paru puede requerir confirmación para continuar"
	paru -Syu
elif command -v pacman >/dev/null
then
	figlet Pacman
	notify-send "Pacman update" "Pacman puede requerir confirmación para continuar"
	sudo pacman -Syu
fi

if command -v zypper >/dev/null
then
	figlet Zypper
	notify-send "Zypper distro update" "Zypper puede requerir confirmación para continuar"
	sudo zypper dup
fi

if command -v dnf >/dev/null
then
    figlet Dnf
    sudo dnf update -y
    sudo dnf autoremove -y
fi

if command -v apt >/dev/null
then
    figlet Apt update
    sudo apt update -y

    figlet Apt upgrade
    sudo apt upgrade -y
fi

if command -v flatpak >/dev/null
then
    figlet Flatpak
    flatpak update -y
    flatpak uninstall --unused -y
fi

date -I > ~/.config/last-updated

figlet Terminado!
notify-send 'Update' 'Las actualizaciones ya han terminado'
