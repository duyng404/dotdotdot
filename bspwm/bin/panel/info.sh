#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.

clock() {
    date '+%m月 %d日 %I:%M %p'
}

battery() {
	if [ -d /sys/class/power_supply/BAT0 ] ; then
		BATC=/sys/class/power_supply/BAT0/capacity
		BATS=/sys/class/power_supply/BAT0/status
		capacity=`tr -d '\n' < $BATC`
		if [ "`cat $BATS`" = "Charging" ] ; then icon="\ue201"
		elif [ "$capacity" -eq 100 ] ; then icon="\ue200"
		elif [ "$capacity" -gt 50 ] ; then icon="\ue1ff"
		elif [ "$capacity" -gt 20 ] ; then icon="\ue1fe"
		else icon="\ue1fd"
		fi

		echo "$icon$capacity"
	fi
}

cpuload() {
	echo "\ue224`mpstat | awk '$3 ~ /CPU/ { for(i=1;i<=NF;i++) { if ($i ~ /%idle/) field=i } } $3 ~ /all/ { printf("%d%%",100 - $field) }'`"
}

memused() {
	aa=`free -m | awk 'NR==2{printf "%d%%",$3*100/$2 }'`
	echo "\ue021$aa"
}

network() {
    read lo int1 int2 <<< `ip link | sed -n 's/^[0-9]: \(.*\):.*$/\1/p'`
    if iwconfig $int1 >/dev/null 2>&1; then
        wifi=$int1
        eth0=$int2
    else
        wifi=$int2
        eth0=$int1
    fi
    ip link show $eth0 | grep 'state UP' >/dev/null && int="eth0" ||int="wifi"

    #int=eth0

    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "\ue222" || echo "\ue21f"
}

thermal() {
	ttt=`sensors | grep temp1 | awk 'NR==1{printf $2}' | tr -d '+' | cut -c 1,2`
	if [[ $ttt ]]; then echo "\ue0ca$ttt"; fi
}

volume() {
	level=`amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p' | uniq`
	state=`amixer get Master | sed -n 's/^.*\[\(o[nf]\+\)]$/\1/p' | uniq`
	if [[ $state == "on" ]]; then
		echo -n "\ue05d$level"
	else
		echo -n "\ue05d--"
	fi
}

mpd(){
	state=`mpc | sed -n 's/^.*\[\([^\[].*\)\] .*$/\1/p' | uniq`
	current=`mpc current -f "%albumartist% - %title%"`
	if [[ $state == "playing" ]]; then
		indicator="U"
	else
		indicator="P"
	fi
	echo -n "$indicator\ue05c $current"
}

caff(){  #caffeine script
	state=`caff.sh -s`
	if [[ $state == "on" ]]; then
		indicator="\ue1c2"
	else
		indicator="\ue1bc"
	fi
	echo -n "$indicator"
}

# print out all the stuff
while :; do
	printf "%s\n" "S$(clock)"
	printf "%s\n" "N$(network)"
	[ $(battery) ] && printf "%s\n" "B$(battery)"
	printf "%s\n" "C$(cpuload)"
	printf "%s\n" "M$(memused)"
	[ $(thermal) ] && printf "%s\n" "E$(thermal)"
	printf "%s\n" "V$(volume)"
	[ "$(mpd)" ] && printf "%s\n" "U$(mpd)"
	printf "%s\n" "A$(caff)"
    sleep 2 # The HUD will be updated every 2 second
done
