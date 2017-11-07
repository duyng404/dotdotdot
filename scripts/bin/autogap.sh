#!/bin/sh
gapone=35
gaptwo=25
gapthree=15

padone=30
padtwo=5
padthree=0

bspc subscribe report | while read line; do
	noofwin=`bspc query -N -d | wc -l`
	if [ "$noofwin" -lt "5" ]; then
		bspc config -d focused window_gap $gapone;
		bspc config -d focused right_padding $padone;
		bspc config -d focused left_padding $padone;
	elif [ "$noofwin" -lt "7" ]; then
		bspc config -d focused window_gap $gaptwo;
		bspc config -d focused right_padding $padtwo;
		bspc config -d focused left_padding $padtwo;
	else
		bspc config -d focused window_gap $gapthree;
		bspc config -d focused right_padding $padthree;
		bspc config -d focused left_padding $padthree;
	fi
done
