#!/bin/sh
found=false
for win in `bspc query -N -d ^6`; do
	if [ "`bspc query -T -n $win | jshon -e client -e instanceName`" == '"chromium"' ]; then
		found=true
		bspc node -f "$win"
		break
	fi
done

if [ "$found" = "false" ]; then bspc rule -a Chromium -o desktop=^6 follow=on && chromium
fi
