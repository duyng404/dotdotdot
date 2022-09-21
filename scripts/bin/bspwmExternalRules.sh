#!/bin/sh

#wid=$1
#class=$2
#instance=$3
#
#echo "$wid -- $class -- $instance" >> ~/exrulelog
#
#if [ "$class" != "" ] && [ "$class" != "Polybar" ]; then
#	desk=`bspc query -D -d focused --names`
#	if [ "$desk" == "1/3" ] || [ "$desk" == "1/4" ] || [ "$desk" == "1/5" ]; then
#		wincount=`expr $(bspc query -N -d focused -n .leaf | wc -w) - $(bspc query -N -d focused -n .leaf.floating | wc -w)`
#		if [ "$wincount" == "0" ]; then
#			echo "im in" >> ~/exrulelog
#			#echo `bspc query -N -d focused -n .leaf | wc -w` >> ~/exrulelog
#			bspc node -i
#			bspc node -i
#			#echo `bspc query -N -d focused -n .leaf | wc -w` >> ~/exrulelog
#			bspc node `bspc query -N -d focused -n .leaf` -p east -o 0.4
#			#echo "node=`bspc query -N -d -n .\!automatic | head -n 1`" >> ~/exrulelog
#			#echo "node=`bspc query -N -d -n .\!automatic | head -n 1`"
#			#echo "split_dir=east"
#			#echo "split_ratio=0.7"
#		fi
#	fi
#fi

fwid=$(bspc query -N -n focused.automatic)

if [ -n "$fwid" ] ; then
	wattr wh $fwid | {
		read width height
		if [ $width -gt $height ] ; then
			echo "split_dir=east"
		else
			echo "split_dir=north"
		fi
		echo "split_ratio=0.5"
	}
fi
