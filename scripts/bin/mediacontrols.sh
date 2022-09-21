#!/bin/bash

# run spotify or focus it
if [ "$1" == "spotify" ]; then
	if [ "`playerctl --list-all 2>/dev/null | grep spotify`" == "spotify" ]; then
		bspc desktop -f ^8
	else
		spotify --force-device-scale-factor=1.5 2>/dev/null & disown
	fi

# kill spotify
elif [ "$1" == "spotify-kill" ]; then
	pkill -15 spotify

# spotify toggle
elif [ "$1" == "spotify-toggle" ]; then
	playerctl -p spotify play-pause
#spotify next
elif [ "$1" == "spotify-next" ]; then
	playerctl -p spotify next
#spotify previous
elif [ "$1" == "spotify-prev" ]; then
	playerctl -p spotify previous

# run ggpm or focus it
elif [ "$1" == "ggpm" ]; then
	if [ "`playerctl --list-all 2>/dev/null | grep google-play`" != "" ]; then
		bspc desktop -f ^8
	else
		gpmdp 2>/dev/null & disown
	fi

# kill ggpm
elif [ "$1" == "ggpm-kill" ]; then
	pkill -15 Google\ Play

# ggpm toggle
elif [ "$1" == "ggpm-toggle" ]; then
	playerctl -p google-play-music-desktop-player play-pause
# ggpm next
elif [ "$1" == "ggpm-next" ]; then
	playerctl -p google-play-music-desktop-player next
# ggpm previous
elif [ "$1" == "ggpm-prev" ]; then
	playerctl -p google-play-music-desktop-player previous

fi

#if [ "`playerctl --list-all 2>/dev/null`" == "spotify" ]; then
#	if [ "$1" == "toggle" ]; then
#		playerctl play-pause
#	elif [ "$1" == "next" ]; then
#		playerctl next
#	elif [ "$1" == "prev" ]; then
#		playerctl previous
#	elif [ "$1" == "switch" ]; then
#		pkill -15 spotify
#		ncmpwindow.sh
#	fi
#else
#	if [ "$1" == "toggle" ]; then
#		mpc toggle -q
#	elif [ "$1" == "next" ]; then
#		mpc next -q
#	elif [ "$1" == "prev" ]; then
#		mpc prev -q
#	elif [ "$1" == "switch" ]; then
#		mpc clear
#		bspc desktop -f ^8
#		spotify
#	fi
#fi
