#!/usr/bin/env bash

if [[ ! -n `pidof i3lock` ]]; then
	icon="$HOME/dot/lock.png"
	tmpbg="$HOME/tmp/screen.png"

	(( $# )) && { icon=$1; }

	scrot "$tmpbg"
	convert "$tmpbg" -brightness-contrast -18x-20 -scale 10% -scale 1000% "$tmpbg"
	convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
	i3lock -i "$tmpbg"
fi
