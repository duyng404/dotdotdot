#!/bin/sh

if [[ ! -n `pidof i3lock` ]]; then
	files=($HOME/usr/img/lockscreen/*)
	icon="`printf "%s\n" "${files[RANDOM % ${#files[@]}]}"`"
	tmpbg="$HOME/tmp/screen.png"

	(( $# )) && { icon=$1; }

	#scrot "$tmpbg"
	maim "$tmpbg"
	#convert "$tmpbg" -scale 10% -scale 1000% -brightness-contrast -25x10 "$tmpbg"
	convert "$tmpbg" -modulate 85,50,100 -scale 10% -scale 1000% "$tmpbg"
	convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
	pkill compton
	i3lock -i "$tmpbg" -n
	killall -USR1 compositorlauncher.sh
	which killall
fi
