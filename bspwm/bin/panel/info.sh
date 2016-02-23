#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.

clock() {
    date '+%m月 %d日 %I:%M %p'
}

battery() {
	if [ -f /sys/class/power_supply ] ; then
		BATC=/sys/class/power_supply/BAT0/capacity
		BATS=/sys/class/power_supply/BAT0/status

		tr -d '\n' < $BATC
		test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'
	fi
}

cpuload() {
	mpstat | awk '$3 ~ /CPU/ { for(i=1;i<=NF;i++) { if ($i ~ /%idle/) field=i } } $3 ~ /all/ { printf("%d%%",100 - $field) }'
}

memused() {
	free -m | awk 'NR==2{printf "%d%%",$3*100/$2 }'
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
        echo "$int" || echo "----"
}

thermal() {
	sensors | grep temp1 | awk 'NR==1{printf $2}' | tr -d '+'
}
# print out all the stuff
while :; do
	printf "%s\n" "S$(clock)"
	printf "%s\n" "N$(network)"
	[ $(battery) ] && printf "%s\n" "B$(battery)"
	printf "%s\n" "C$(cpuload)"
	printf "%s\n" "M$(memused)"
	[ $(thermal) ] && printf "%s\n" "E$(thermal)"
    sleep 2 # The HUD will be updated every 2 second
done
