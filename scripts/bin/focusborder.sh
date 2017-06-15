#!/bin/bash
width_focused=4
width_unfocused=0

xtitle -s| while read; do
    bspc config -n $currendID border_width $width_unfocused
    bspc config -n focused border_width $width_focused
    currendID=$(bspc query -N -n focused)
done
