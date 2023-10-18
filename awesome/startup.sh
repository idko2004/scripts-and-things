#!/bin/bash
date

#Inicar servidor de audio
if pgrep -x "pipewire" > /dev/null
then
	echo "Pipewire is running"
else
	echo "--Running pipewire"
	/usr/bin/pripewire &
	/usr/bin/pipewire-pulse &
fi



#Iniciar compositor
if pgrep -x "picom" > /dev/null
then
	echo "Picom is running"
else
	echo "--Running picom"
	picom --glx-no-stencil --vsync --unredir-if-possible --xrender-sync-fence --xrender-sync-fence --backend glx &
fi



#Cambiador de temas
hour=`date +%k`
if ((hour >= 17))
then
	#Tema oscuro
	echo "--Aplicando tema oscuro"
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/gtk3.js
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/gtk4.js
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/flatpak.js
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/vscodium.js
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/alacritty.js
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/micro.js
else
	#Tema claro
	echo "--Aplicando tema claro"
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/gtk3.js
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/gtk4.js
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/flatpak.js
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/vscodium.js
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/alacritty.js
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/micro.js
fi



#Iniciar polkit
if pgrep -f "polkit-gnome-authentication-agent-1" > /dev/null
then
	echo "Polkit is running"
else
	echo "--Running gnome polkit"
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi



#Iniciar el daemon de thunar
if pgrep -x "thunar" > /dev/null
then
	echo "Thunar is running"
else
	echo "--Running thunar"
	thunar --daemon &
fi



# Iniciar copyQ
if pgrep -x "copyq" > /dev/null
then
	echo "CopyQ is running"
else
	echo "--Running copyQ"
	copyq &
fi



#Inicar widget de volumen
if pgrep -x "volctl" > /dev/null
then
	echo "Volctl is running"
else
	echo "--Running volctl"
	volctl &
fi
