#!/bin/bash
. ~/.cache/wal/colors.sh
if [ "`playerctl --list-all 2>/dev/null`" == "spotify" ]; then
	if [ "$1" == "toggle" ]; then
		playerctl play-pause
	fi
	if [ "`playerctl status 2>/dev/null`" == "Playing" ]; then
		# base
		res="  `playerctl metadata artist` ー `playerctl metadata title`"
		# add click area
		res="%{A:playerctl play-pause:}$res%{A}"
		# add prev button
		res="$res   %{A:playerctl previous:}%{A}"
		#add next button
		res="$res  %{A:playerctl next:}%{A}"
		# add padding
		res="   $res   "
		# add color
		res="%{F$color1}$res%{F-}"
		# add underline
		res="%{u$color1 +u}$res%{-u}"
	elif [ "`playerctl status 2>/dev/null`" == "Paused" ]; then
		# base
		res="  `playerctl metadata artist` ー `playerctl metadata title`"
		# add click area
		res="%{A:playerctl play-pause:}$res%{A}"
		# add prev button
		res="$res   %{A:playerctl previous:}%{A}"
		#add next button
		res="$res  %{A:playerctl next:}%{A}"
		# add padding
		res="   $res   "
		# add color
		res="%{F#777}$res%{F-}"
		# add click area
		res="%{A:playerctl play-pause:}$res%{A}"
	fi
	echo "$res"
else
	echo ""
fi
