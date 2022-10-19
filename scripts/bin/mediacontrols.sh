#!/bin/bash
if [ "`playerctl --list-all 2>/dev/null`" == "spotify" ]; then
	alias playerctl="playerctl -p spotify"
	if [ "$1" == "toggle" ]; then
		playerctl play-pause
	elif [ "$1" == "next" ]; then
		playerctl next
	elif [ "$1" == "prev" ]; then
		playerctl previous
	fi
fi
