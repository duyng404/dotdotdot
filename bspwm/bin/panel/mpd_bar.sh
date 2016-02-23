#!/bin/sh
state=`mpc | sed -n 's/^.*\[\([^\[].*\)\] .*$/\1/p' | uniq`
song=`mpc -f "%albumartist% - %title%" | head -1`
if [[ $state == "playing" ]]; then
	indicator="U"
else
	indicator="P"
fi
printf "%s\n" "U$indicator$song" > "$PANEL_FIFO"
