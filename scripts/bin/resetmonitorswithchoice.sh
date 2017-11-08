#!/bin/sh
bspc rule -a Arandr -o follow=on state=floating
arandr
wal -i "$(< "${HOME}/.cache/wal/wal")" -a 90
wal -f ~/dot/walcolors -a 90
. ~/.config/bspwm/bspwmrc
