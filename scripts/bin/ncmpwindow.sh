#!/bin/bash
if [ "`playerctl --list-all 2>/dev/null`" == "spotify" ]; then
	bspc desktop -f ^8
else
	found=false
	for win in `bspc query -N -d ^8`; do
		if [ "`bspc query -T -n $win | jshon -e client -e instanceName`" == '"ncmp"' ]; then
			found=true
			bspc node -f "$win"
			break
		fi
	done

	if [ "$found" = "false" ]; then bspc rule -a URxvt -o desktop=^8 follow=on; urxvt -name ncmp -e ncmpcpp
	fi
fi
