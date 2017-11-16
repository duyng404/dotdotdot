#!/bin/bash
if [ "`playerctl --list-all 2>/dev/null`" == "spotify" ]; then
	if [ "$1" == "toggle" ]; then
		playerctl play-pause
	elif [ "$1" == "next" ]; then
		playerctl next
	elif [ "$1" == "prev" ]; then
		playerctl previous
	elif [ "$1" == "switch" ]; then
		pkill -15 spotify
		ncmpwindow.sh
	fi
else
	if [ "$1" == "toggle" ]; then
		mpc toggle -q
	elif [ "$1" == "next" ]; then
		mpc next -q
	elif [ "$1" == "prev" ]; then
		mpc prev -q
	elif [ "$1" == "switch" ]; then
		mpc clear
		bspc desktop -f ^8
		spotify
	fi
fi
