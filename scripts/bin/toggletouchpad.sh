#!/bin/sh
deviceid=`xinput | grep Synaptics | awk '{print $5}' | cut -c 4-`
if [ $1 == "toggle" ]; then
	id=`cat ~/tmp/toggletouchpad.tmp`
	kill -USR1 $id
	exit
fi

echo $$ > ~/tmp/toggletouchpad.tmp
t=0

toggle() {
    t=$(((t + 1) % 2))
	s=`xinput list-props $deviceid | awk '/Device Enabled/{print $4}'`
	if [ $s == 0 ]; then
		xinput enable $deviceid
	else
		xinput disable $deviceid
	fi
}


trap "toggle" USR1

while true; do
	s=`xinput list-props $deviceid | awk '/Device Enabled/{print $4}'`
	if [ $s == 1 ]; then
		echo 
    else
		echo 
    fi
    sleep 5 &
    wait
done
