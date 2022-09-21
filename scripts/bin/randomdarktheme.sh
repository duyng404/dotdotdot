#!/bin/sh
prev="`cat .cache/wal/colors.json | jshon -e wallpaper -u`"
prev="${prev::-4}.json"
while true; do
	files=($HOME/usr/img/wall/night/*.json)
	file="`printf "%s\n" "${files[RANDOM % ${#files[@]}]}"`"
	echo $file
	echo $prev
	if [ "$file" != "$prev" ]; then
		wal -g -f $file -o ~/.config/bspwm/bspwmrc
		break
	fi
done
