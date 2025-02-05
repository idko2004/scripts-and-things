#! /bin/bash
# Dunst notification sound
#env > ~/envs

#Custom sound for specific applications
if [[ "$DUNST_APP_NAME" = "batsignal" ]]
then
	if [[ "$DUNST_URGENCY" = "CRITICAL" ]]
	then
		#Critical battery sound
		pw-play "/home/idko/.local/share/sounds/Landscape/og/Windows Battery Critical.wav"
	else
		#Normal battery sound
		pw-play "/home/idko/.local/share/sounds/Landscape/og/Windows Battery Low.wav"
	fi
else

#Normal notifications
	if [[ "$DUNST_URGENCY" = "LOW" ]]
	then
		pw-play "/home/idko/.local/share/sounds/Landscape/og/Windows Default.wav"
	elif [[ "$DUNST_URGENCY" = "NORMAL" ]]
	then
		pw-play "/home/idko/.local/share/sounds/Landscape/og/Windows Default.wav"
	elif [[ "$DUNST_URGENCY" = "CRITICAL" ]]
	then
		pw-play "/home/idko/.local/share/sounds/Landscape/og/Windows Critical Stop.wav"
	fi
fi