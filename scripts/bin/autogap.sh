#!/bin/sh
gapone=10
gaptwo=8
gapthree=5

padone=0
padtwo=0
padthree=0

bspc subscribe report | while read line; do
	noofwin=`bspc query -N -d -n .leaf.tiled | wc -l`
	if [ "$noofwin" -lt "2" ]; then
		bspc config -d focused window_gap $gapone;
		bspc config -d focused right_padding $padone;
		bspc config -d focused left_padding $padone;
	elif [ "$noofwin" -lt "3" ]; then
		bspc config -d focused window_gap $gaptwo;
		bspc config -d focused right_padding $padtwo;
		bspc config -d focused left_padding $padtwo;
	else
		bspc config -d focused window_gap $gapthree;
		bspc config -d focused right_padding $padthree;
		bspc config -d focused left_padding $padthree;
	fi
done
