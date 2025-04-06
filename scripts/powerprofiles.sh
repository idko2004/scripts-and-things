#!/bin/bash

if [[ $1 == "performance" ]]
then
	powerprofilesctl set performance
	notify-send "Power Profiles" "Performance mode set" -u low
elif [[ $1 == "balanced" ]]
then
	powerprofilesctl set balanced
	notify-send "Power Profiles" "Balanced mode set" -u low
elif [[ $1 == "power-saver" ]]
then
	powerprofilesctl set power-saver
	notify-send "Power Profiles" "Power Saver mode set" -u low
else
	notify-send "Power Profiles" "Undetermined power profile D:" -u critical
fi
