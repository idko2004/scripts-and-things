#!/bin/bash
pgrep wlsunset

if [ $? -eq 1 ]
then
	brightnessctl set 1
	wlsunset -t 100 -T 101 -S 06:00 -s 06:01 -d 1
fi