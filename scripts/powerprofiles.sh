#!/bin/bash
RESULT="$(echo -e $'Battery save\nBalanced\nPerformance' | rofi -dmenu -font 'UbuntuMono Nerd Font Bold 14')"

if [[ $RESULT == "Performance" ]]
then
	powerprofilesctl set performance
	notify-send "Power Profiles" "Performance mode set" -u low
elif [[ $RESULT == "Balanced" ]]
then
	powerprofilesctl set balanced
	notify-send "Power Profiles" "Balanced mode set" -u low
elif [[ $RESULT == "Battery save" ]]
then
	powerprofilesctl set power-saver
	notify-send "Power Profiles" "Power Saver mode set" -u low
else
	notify-send "Power Profiles" "Undetermined power profile D:" -u critical
fi
