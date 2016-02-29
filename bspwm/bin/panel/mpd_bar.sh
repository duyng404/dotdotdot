#!/bin/sh
state=`mpc | sed -n 's/^.*\[\([^\[].*\)\] .*$/\1/p' | uniq`
song=`mpc current -f "%albumartist% - %title%"`
if [[ $state == "playing" ]]; then
	indicator="U"
else
	indicator="P"
fi
printf "%s\n" "U$indicator\ue05c $song" > "$PANEL_FIFO"
