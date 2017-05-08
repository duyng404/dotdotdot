#!/bin/bash
#all_monitors=$(xrandr -q | awk '/connected/ {print $1}')
#default_screen=$(xrandr | awk '/ connected/ {print $1;exit;}')
#extra_monitors=$(xrandr -q | awk '/connected/ {print $1}' | grep -v $default_screen)

##First, configure stuff with xrandr
#[[ $(who) != "" ]] && USER=$(who | grep :0\) | cut -f 1 -d ' ') || \
#USER=$(echo /home/* | cut -f 3 -d '/')

#export DISPLAY=:0.0
#export XAUTHORITY=/home/$USER/.Xauthority

#for monitor in $extra_monitors; do
#	prev_mon=$(xrandr | awk '/connected/ {print $1}' | grep -B1 "^$monitor" | grep -vE "^$monitor|^--$")
#	xrandr --output $monitor \
#		--auto \
#		--right-of $prev_mon
#done

##Then, create workspaces on all monitors
  I=1
  M=$(bspc query -M | wc -l)
  if [[ "$M" == 1 ]]; then
    bspc monitor -d 一 二 三 四 五 六 七 八
  elif [[ "$M" == 2 ]]; then
     bspc monitor $(bspc query -M | awk NR==1) -d 一 二 三 四
     bspc monitor $(bspc query -M | awk NR==2) -d 五 六 七 八
  elif [[ "$M" == 3 ]]; then
     bspc monitor $(bspc query -M | awk NR==1) -d 一 二
     bspc monitor $(bspc query -M | awk NR==2) -d 三 四 五
     bspc monitor $(bspc query -M | awk NR==3) -d 六 七 八
  else
    for monitor in $(bspc query -M); do
    bspc monitor $monitor \
        -n "$I" \
        -d $I/{a,b,c}
     let I++
     done
  fi

