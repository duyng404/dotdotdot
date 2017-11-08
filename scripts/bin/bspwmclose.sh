#!/bin/bash
for window_id in $(bspc query -N); do
	bspc node $window_id -c
done
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
ibus exit
bspc quit
