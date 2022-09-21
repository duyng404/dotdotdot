#!/bin/sh
. ~/.cache/wal/colors.sh

status_ggpm () {
	if [ "`playerctl --list-all 2>/dev/null | grep google-play`" != "" ]; then
		command="playerctl -p google-play-music-desktop-player"
		if [ "`$command status 2>/dev/null`" == "Playing" ]; then
			# base
			res="  `$command metadata artist 2>/dev/null` ー `$command metadata title 2>/dev/null`"
			# add click area
			res="%{A:mediacontrols.sh ggpm-toggle 2>/dev/null && kill -USR1 $$:}$res%{A}"
			# add prev button
			res="$res   %{A:mediacontrols.sh ggpm-prev 2>/dev/null && kill -USR1 $$:}  %{A}"
			#add next button
			res="$res  %{A:mediacontrols.sh ggpm-next 2>/dev/null && kill -USR1 $$:}  %{A}"
			# add close icon
			res="$res%{A:mediacontrols.sh ggpm-kill && kill -USR1 $$:}  %{A}"
			# add padding
			res="   $res   "
			# add color
			res="%{F$color1}$res%{F-}"
			# add underline
			res="%{u$color1 +u}$res%{-u}"
		elif [ "`$command status 2>/dev/null`" == "Paused" ]; then
			# base
			res="  `$command metadata artist 2>/dev/null` ー `$command metadata title 2>/dev/null`"
			# add click area
			res="%{A:mediacontrols.sh ggpm-toggle 2>/dev/null && kill -USR1 $$:}$res%{A}"
			# add prev button
			res="$res   %{A:mediacontrols.sh ggpm-prev 2>/dev/null && kill -USR1 $$:}  %{A}"
			#add next button
			res="$res  %{A:mediacontrols.sh ggpm-next 2>/dev/null && kill -USR1 $$:}  %{A}"
			# add close icon
			res="$res%{A:mediacontrols.sh ggpm-kill && kill -USR1 $$:}  %{A}"
			# add padding
			res="   $res   "
			# add color
			res="%{F#777}$res%{F-}"
		fi
		echo "$res"
	else
		echo "%{F#444}%{A:kill -WINCH $$:}  ーー %{A}%{F-}"
	fi
}

status_spotify () {
	if [ "`playerctl --list-all 2>/dev/null | grep spotify`" == "spotify" ]; then
		if [ "`playerctl -p spotify status 2>/dev/null`" == "Playing" ]; then
			# base
			res="  `playerctl -p spotify metadata artist` ー `playerctl -p spotify metadata title`"
			# add click area
			res="%{A:mediacontrols.sh spotify-toggle 2>/dev/null && kill -USR1 $$:}$res%{A}"
			# add prev button
			res="$res   %{A:mediacontrols.sh spotify-prev && kill -USR1 $$:}  %{A}"
			#add next button
			res="$res  %{A:mediacontrols.sh spotify-next && kill -USR1 $$:}  %{A}"
			# add close icon
			res="$res%{A:mediacontrols.sh spotify-kill && kill -USR1 $$:}  %{A}"
			# add padding
			res="   $res   "
			# add color
			res="%{F$color1}$res%{F-}"
			# add underline
			res="%{u$color1 +u}$res%{-u}"
		elif [ "`playerctl -p spotify status 2>/dev/null`" == "Paused" ]; then
			# base
			res="  `playerctl -p spotify metadata artist` ー `playerctl -p spotify metadata title`"
			# add click area
			res="%{A:mediacontrols.sh spotify-toggle 2>/dev/null && kill -USR1 $$:}$res%{A}"
			# add prev button
			res="$res   %{A:mediacontrols.sh spotify-prev && kill -USR1 $$:}  %{A}"
			#add next button
			res="$res  %{A:mediacontrols.sh spotify-next && kill -USR1 $$:}  %{A}"
			# add close icon
			res="$res%{A:mediacontrols.sh spotify-kill && kill -USR1 $$:}  %{A}"
			# add padding
			res="   $res   "
			# add color
			res="%{F#777}$res%{F-}"
		fi
		echo "$res"
	else
		echo "%{F#444}%{A:kill -USR2 $$:}  ーー %{A}%{F-}"
	fi
}

query_status () {
	status_ggpm
	status_spotify
}

toggle() {
	echo $(query_status)
}

spotify() {
	mediacontrols.sh spotify
}

ggpm() {
	mediacontrols.sh ggpm
}

trap "toggle" USR1
trap "spotify" USR2
trap "ggpm" WINCH

while true; do
	echo $(query_status)
    sleep 1 &
	wait
done
