#!/bin/bash
connectedOutputs=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
disconnectedOutputs=$(xrandr | grep " disconnected" | sed -e "s/\([A-Z0-9]\+\) disconnected.*/\1/")
prev=LVDS1
for monitor in $connectedOutputs; do
	if [ $monitor == "LVDS1" ]; then
		xrandr --output $monitor --auto
		prev=$monitor
	else
		xrandr --output $monitor --auto --left-of $prev
		prev=$monitor
	fi
done

for monitor in $disconnectedOutputs; do
	xrandr --output $monitor --off
	for bspwmmonitor in $(bspc query -M); do
		if [ $monitor == $bspwmmonitor ]; then
			bspc wm -r $monitor
		fi
	done
done
