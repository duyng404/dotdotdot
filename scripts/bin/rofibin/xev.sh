#!/bin/sh

bspc rule -a Termite:termite -o follow=on state=floating
termite -e xev
