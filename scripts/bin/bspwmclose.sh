#!/bin/bash
for window_id in $(bspc query -N); do
	bspc node $window_id -c
done
ibus exit
bspc quit
