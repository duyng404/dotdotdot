# script to change gaps on the fly

oldgap=`bspc config window_gap`

[[ $1 == "+" ]] && newgap=$(($oldgap + $2))
[[ $1 == "-" ]] && newgap=$(($oldgap - $2))

echo $newgap
export WM_GAP=$newgap

~/.config/bspwm/bspwmrc

