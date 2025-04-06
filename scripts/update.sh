#!/bin/bash

### VARIABLES PERSONALIZABLES
DELETE_ARCH_CACHE=1 #Elimina paquetes de versiones anteriores que pacman almacena para poder revertir la actualización, pacman nunca elimina estos paquetes, por lo que pueden llegar a ocupar gigabytes de espacio. Si crees que no los vas a necesitar, pon esta variable a 1.
USE_REFLECTOR=1 #Permite usar el comando reflector para actualizar mirrors
REFLECTOR_COUNTRIES="Paraguay,Brazil,Chile,Mexico,United\\\ States,"
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

#ARCH SECTION

if [[ $USE_REFLECTOR == 1 ]]
then
	if command -v reflector >/dev/null
	then
		figlet Reflector

		#Please update this command to use your local mirrors
		reflector --country "${REFLECTOR_COUNTRIES}" --protocol https --latest 15 --fastest 5 --save /tmp/io.github.idko2004.scriptsandthings.update
		cat /tmp/io.github.idko2004.scriptsandthings.update #Just to show the result in the terminal
		sudo mv /tmp/io.github.idko2004.scriptsandthings.update /etc/pacman.d/mirrorlist
	fi
fi

if command -v paru >/dev/null
then
	figlet Paru
	notify-send "Paru update" "Paru puede requerir confirmación para continuar"
	paru -Syu
	
	if [[ $DELETE_ARCH_CACHE == 1 ]]
	then
		echo -e "\033[0;33mDeleting paru cache...\033[0m"
		rm -fr ~/.cache/paru/*
		echo -e "\033[0;33mDeleting pacman cache...\033[0m"
		sudo rm /var/cache/pacman/pkg/*
	fi

elif command -v yay >/dev/null
then
	figlet Yay
	notify-send "Yay update" "Yay puede requerir confirmación para continuar"
	yay
	
	if [[ $DELETE_ARCH_CACHE == 1 ]]
	then
		echo -e "\033[0;33mDeleting yay cache...\033[0m"
		rm -fr ~/.cache/yay/*
		echo -e "\033[0;33mDeleting pacman cache...\033[0m"
		sudo rm /var/cache/pacman/pkg/*
	fi

elif command -v pacman >/dev/null
then
	figlet Pacman
	notify-send "Pacman update" "Pacman puede requerir confirmación para continuar"
	sudo pacman -Syu
	
	if [[ $DELETE_ARCH_CACHE == 1 ]]
	then
		echo -e "\033[0;33mDeleting pacman cache...\033[0m"
		sudo rm /var/cache/pacman/pkg/*
	fi

fi

#END ARCH SECTION

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
