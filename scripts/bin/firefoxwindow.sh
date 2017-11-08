#!/bin/bash
found=false
for win in `bspc query -N -d ^6`; do
	if [ "`bspc query -T -n $win | jshon -e client -e instanceName`" == '"Navigator"' ]; then
		found=true
		bspc node -f "$win"
		break
	fi
done

if [ "$found" = "false" ]; then bspc rule -a Firefox -o desktop=^6 follow=on && GTK_THEME=Adwaita:light firefox
fi
