#!/bin/sh
found=false
for win in `bspc query -N -d ^6`; do
	if [ "`bspc query -T -n $win | jshon -e client -e instanceName`" == '"ncmp"' ]; then
		found=true
		bspc node -f "$win"
		break
	fi
done

if [ "$found" = "false" ]; then bspc rule -a URxvt -o desktop=^6 follow=on && urxvt -name ncmp -e ncmpcpp
fi
