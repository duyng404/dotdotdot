#!/bin/bash
. ~/.cache/wal/colors.sh
if [ "`playerctl --list-all 2>/dev/null | grep spotify`" == "spotify" ]; then
	pctl="playerctl -p spotify"
	metaformat="$pctl metadata --format '{{trunc(artist,20)}} ー {{trunc(title,30)}}'"
	if [ "$1" == "toggle" ]; then
		eval $pctl play-pause
	fi
	if [ "`$pctl status 2>/dev/null`" == "Playing" ]; then
		# base
		res="  $(eval $metaformat)"
		# add click area
		res="%{A:$pctl play-pause:}$res%{A}"
		# add prev button
		res="$res   %{A:$pctl previous:}%{A}"
		#add next button
		res="$res  %{A:$pctl next:}%{A}"
		# add padding
		res="  $res  "
		# add color
		res="%{F$color14}$res%{F-}"
		# add underline
		# res="%{u$color1 +u}$res%{-u}"
		# add background
		res="%{B$color1 +u}$res%{B-}"
	elif [ "`$pctl status 2>/dev/null`" == "Paused" ]; then
		# base
		res="  $(eval $metaformat)"
		# add click area
		res="%{A:$pctl play-pause:}$res%{A}"
		# add prev button
		res="$res   %{A:$pctl previous:}%{A}"
		#add next button
		res="$res  %{A:$pctl next:}%{A}"
		# add padding
		res="  $res  "
		# add color
		res="%{F#777}$res%{F-}"
		# add click area
		res="%{A:$pctl play-pause:}$res%{A}"
	fi
	echo "$res"
else
	echo "   --  "
fi
