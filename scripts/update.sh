#!/bin/bash

### CUSTOMIZABLE VARIABLES
DELETE_ARCH_CACHE=1 #Deletes old versions of packages that pacman, paru and yay save in case the case of something going bad, so you can restore the old version, pacman never deletes these packages so they can end up taking several gigabytes. If you feel you're not gonna need them, set this to 1.
                    #Elimina paquetes de versiones anteriores que pacman almacena para poder revertir la actualización, pacman nunca elimina estos paquetes, por lo que pueden llegar a ocupar gigabytes de espacio. Si crees que no los vas a necesitar, pon esta variable a 1.
USE_REFLECTOR=1 #Use the program "reflector" to update mirrors.
                #Usar el comando "reflector" para actualizar mirrors
REFLECTOR_COUNTRIES="Paraguay,Brazil,Chile,Mexico,United\\\ States," #Update this with "reflector --list-countries" and copy the countries you would like mirrors from.
                                                                     #Actualiza esto con "reflector --list-countries" y copia los paises de los cuales quieres usar un mirror.
###

if ! command -v cowsay >/dev/null
then
    echo "cowsay it's not installed (very important)"
    exit 1
fi
if ! command -v figlet >/dev/null
then
    cowsay "figlet it's not installed (very important)"
    exit 1
fi
if ! command -v lolcat >/dev/null
then
	cowsay "lolcat it's not installed (very important)"
	exit 1
fi
if ! command -v notify-send >/dev/null
then
	cosway "notify-send it's not installed"
	exit 1
fi


figlet Sudo password | lolcat
sudo echo ":)"
if [[ $? != "0" ]]
then
	cowsay "Goodbye"
	exit 1
fi

# Crear el archivo de última vez actualizado si es que no existe y poner la fecha del inicio de los tiempos.
if [ ! -f ~/.local/share/idko2004.github.io/last-updated ]
then
	mkdir -p ~/.local/share/idko2004.github.io/
	touch ~/.local/share/idko2004.github.io/last-updated
	echo "1970-01-01" > ~/.local/share/idko2004.github.io/last-updated
fi

#ARCH SECTION

if [[ $USE_REFLECTOR == 1 ]]
then
	if command -v reflector >/dev/null
	then
		figlet Reflector | lolcat
		if [[ "$(cat ~/.local/share/idko2004.github.io/last-updated)" != "$(date -I)" ]]
		then
			#Please update this command to use your local mirrors
			reflector --verbose --country "${REFLECTOR_COUNTRIES}" --protocol https --latest 25 --fastest 5 --save /tmp/idko2004-reflector
			cat /tmp/idko2004-reflector #Just to show the result in the terminal
			sudo mv /tmp/idko2004-reflector /etc/pacman.d/mirrorlist
		else
			cowsay "Reflector will be ignored because it was already updated today."
		fi
	fi
fi


if command -v yay >/dev/null
then
	figlet Yay | lolcat
	notify-send "Yay update" "Yay has started working and may need confirmation from your part"
	yay
	
	if [[ $DELETE_ARCH_CACHE == 1 ]]
	then
		cowsay "Deleting yay and pacman cache..."
		rm -fr ~/.cache/yay/*
		sudo rm -r /var/cache/pacman/pkg/*
	fi

elif command -v paru >/dev/null
then
	figlet Paru | lolcat
	notify-send "Paru update" "Paru has started working and may need confirmation from your part"
	paru -Syu
	
	if [[ $DELETE_ARCH_CACHE == 1 ]]
	then
		cowsay "Deleting paru and pacman cache..."
		rm -fr ~/.cache/paru/*
		sudo rm -r /var/cache/pacman/pkg/*
	fi

elif command -v pacman >/dev/null
then
	figlet Pacman | lolcat
	notify-send "Pacman update" "Pacman has started working and may need confirmation from your part"
	sudo pacman -Syu
	
	if [[ $DELETE_ARCH_CACHE == 1 ]]
	then
		cowsay "Deleting pacman cache..."
		sudo rm -r /var/cache/pacman/pkg/*
	fi
fi

#END ARCH SECTION

if command -v zypper >/dev/null
then
	figlet Zypper | lolcat
	notify-send "Zypper distro update" "Zypper has started working and may need confirmation from your part"
	sudo zypper dup
fi


if command -v dnf >/dev/null
then
    figlet Dnf | lolcat
    notify-send "Dnf update" "Dnf has started working and may need confirmation from your part"
    sudo dnf update
    sudo dnf autoremove -y
fi


if command -v apt >/dev/null
then
    figlet Apt update | lolcat
    sudo apt update -y

    figlet Apt upgrade | lolcat
    notify-send "Apt upgrade" "Apt upgrade has started working and may need confirmation from your part"
    sudo apt upgrade
fi


if command -v flatpak >/dev/null
then
    figlet Flatpak | lolcat
    flatpak update -y
    flatpak uninstall --unused -y
fi


date -I > ~/.local/share/idko2004.github.io/last-updated #Guardar la fecha de la última vez que se actualizó

figlet "Terminado!" | lolcat
notify-send 'Update' 'Las actualizaciones ya han terminado'
