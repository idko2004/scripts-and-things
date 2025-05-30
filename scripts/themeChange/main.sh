#Cambiador de temas

######
#	BE CAREFUL WITH THIS SCRIPT
#	IT WILL REPLACE CONFIGURATION FILES OF YOUR PROGRAMS
#	AND IT WILL LIKELY FAIL AT FIRST TRY AND YOU WILL HAVE TO TINKER WITH IT.
#	KEEP BACKUPS OF YOUR DEFAULTS!
#	Uncomment the ones you want, and comment the ones you don't
######

#Change this to your node command
NODE_COMMAND=/home/idko/.nvm/versions/node/v20.5.0/bin/node

hour=`date +%k`
if ((hour >= 17))
then
	#Tema oscuro
	echo "--Aplicando tema oscuro"
	export CHANGE_THEME_TO=dark
	
	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
	#gsettings set org.gnome.desktop.interface icon-theme 'Colloid-dark'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

else
	#Tema claro
	echo "--Aplicando tema claro"
	export CHANGE_THEME_TO=light

	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
	#gsettings set org.gnome.desktop.interface icon-theme 'Colloid-light'
	gsettings set org.gnome.desktop.interface color-scheme 'default'
fi
echo $CHANGE_THEME_TO
$NODE_COMMAND /home/idko/.config/awesome/themeChange/flatpak.js
$NODE_COMMAND /home/idko/.config/awesome/themeChange/vscodium.js
$NODE_COMMAND /home/idko/.config/awesome/themeChange/alacritty.js
$NODE_COMMAND /home/idko/.config/awesome/themeChange/micro.js
#$NODE_COMMAND /home/idko/.config/awesome/themeChange/gtk3.js
#$NODE_COMMAND /home/idko/.config/awesome/themeChange/gtk4.js

unset CHANGE_THEME_TO
