#!/bin/bash
#all_monitors=$(xrandr -q | awk '/ connected/ {print $1}')
#default_screen=$(xrandr | awk '/ connected/ {print $1;exit;}')
#extra_monitors=$(xrandr -q | awk '/ connected/ {print $1}' | grep -v $default_screen)

##First, configure stuff with xrandr
#[[ $(who) != "" ]] && USER=$(who | grep :0\) | cut -f 1 -d ' ') || \
#USER=$(echo /home/* | cut -f 3 -d '/')

#export DISPLAY=:0.0
#export XAUTHORITY=/home/$USER/.Xauthority

#for monitor in $extra_monitors; do
#	prev_mon=$(xrandr | awk '/connected/ {print $1}' | grep -B1 "^$monitor" | grep -vE "^$monitor|^--$")
#	xrandr --output $monitor \
#		--auto \
#		--right-of $prev_mon
#done

##Then, create workspaces on all monitors
I=1
for monitor in $(bspc query -M); do
	bspc monitor $monitor \
		-d $I/{1,2,3,4,5,6,7,8}
	let I++
done
