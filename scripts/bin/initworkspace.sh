#!/bin/bash

bspc config ignore_ewmh_focus true
bspc rule -a firefox desktop=^2 follow=off
bspc rule -a Ferdium desktop=^1 follow=off
bspc rule -a Alacritty desktop=^10 follow=off
bspc rule -a Code desktop=^9 follow=off

firefox &

1password --silent &

ferdium &

code &

alacritty &

spotify &

bspc desktop -f 0
bspc desktop -f 2

sleep 10
bspc rule -r firefox
bspc rule -r Ferdium
bspc rule -r Code
bspc rule -r Alacritty
bspc config ignore_ewmh_focus false
