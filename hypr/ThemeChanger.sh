#Cambiador de temas
hour=`date +%k`
if ((hour >= 17))
then
	#Tema oscuro
	echo "--Aplicando tema oscuro"
	#CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/gtk3.js
	#CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/gtk4.js
	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
	gsettings set org.gnome.desktop.interface icon-theme 'Colloid-dark'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	#CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/flatpak.js
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/vscodium.js
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/alacritty.js
	CHANGE_THEME_TO=dark /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/micro.js
else
	#Tema claro
	echo "--Aplicando tema claro"
	#CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/gtk3.js
	#CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/gtk4.js
	gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
	gsettings set org.gnome.desktop.interface icon-theme 'Colloid-light'
	gsettings set org.gnome.desktop.interface color-scheme 'default'
	#CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/flatpak.js
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/vscodium.js
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/alacritty.js
	CHANGE_THEME_TO=light /home/idko/.nvm/versions/node/v20.5.0/bin/node /home/idko/.config/awesome/themeChange/micro.js
fi
