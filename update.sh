#! /bin/bash

if ! command -v figlet >/dev/null
then
    echo "Figlet no está instalado"
    exit 1
fi

figlet Sudo password
sudo echo ":)"

if command -v dnf >/dev/null
then
    figlet Dnf
    sudo dnf update -y
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
fi

figlet Terminado!
notify-send 'Update' 'Las actualizaciones ya han terminado'