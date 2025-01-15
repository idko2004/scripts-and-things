#!/bin/bash

### VARIABLES PERSONALIZABLES
DELETE_ARCH_CACHE=1 #Elimina paquetes de versiones anteriores que pacman almacena para poder revertir la actualización, pacman nunca elimina estos paquetes, por lo que pueden llegar a ocupar gigabytes de espacio. Si crees que no los vas a necesitar, pon esta variable a 1.
###

if ! command -v figlet >/dev/null
then
    echo "Figlet no está instalado"
    exit 1
fi
if ! command -v notify-send >/dev/null
then
	echo "notify-send no está instalado"
	exit 1
fi

figlet Sudo password
sudo echo ":)"

if command -v paru >/dev/null
then
	figlet Paru
	notify-send "Paru update" "Paru puede requerir confirmación para continuar"
	paru -Syu
elif command -v yay >/dev/null
then
	figlet Yay
	notify-send "Yay update" "Yay puede requerir confirmación para continuar"
	yay
elif command -v pacman >/dev/null
then
	figlet Pacman
	notify-send "Pacman update" "Pacman puede requerir confirmación para continuar"
	sudo pacman -Syu
fi

#Delete arch cache
if DELETE_ARCH_CACHE -eq 1
then
	figlet "Cleaning"
	if command -v pacman >/dev/null
	then
		echo "Deleting pacman cache..."
		sudo rm /var/cache/pacman/pkg/*
	fi
	if command -v yay >/dev/null
	then
		echo "Deleting yay cache..."
		rm -r ~/.cache/yay/*
	fi
	if command -v paru >/dev/null
	then
		echo "Deleting paru cache..."
		rm -r ~/.cache/paru/*
	fi
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

date -I > ~/.config/last-updated #Guardar la fecha de la última vez que se actualizó

figlet Terminado!
notify-send 'Update' 'Las actualizaciones ya han terminado'
