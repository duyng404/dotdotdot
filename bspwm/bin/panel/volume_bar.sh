#!/bin/sh

level=`amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p' | uniq`
state=`amixer get Master | sed -n 's/^.*\[\(o[nf]\+\)]$/\1/p' | uniq`
if [[ $state == "on" ]]; then
	output=$level
else
	output="--"
fi
printf "%s\n" "V\ue05d$output" > "$PANEL_FIFO"
