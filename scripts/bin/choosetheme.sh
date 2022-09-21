#!/bin/sh

theme=`find ~/usr/img/wall | grep json | cut -c1-23 --complement | \
	rofi -dmenu -modi run \
	-config ~/.config/rofi/quicklaunchconfig \
	-me-select-entry Shift+F11 -me-accept-entry MousePrimary`

for window_id in $(bspc query -N); do bspc node $window_id -c; done
for window_id in $(bspc query -N .leaf.!window); do bspc node $window_id -k; done
wal -f ~/usr/img/wall/$theme -o ~/.config/bspwm/bspwmrc
