#!/bin/sh
found=false
for win in `bspc query -N -d ^7`; do
	if [ "`bspc query -T -n $win | jshon -e client -e instanceName`" == '"thunar"' ]; then
		found=true
		bspc node -f "$win"
		break
	fi
done

if [ "$found" = "false" ]; then bspc rule -a Thunar -o desktop=^7 follow=on && Thunar
fi
