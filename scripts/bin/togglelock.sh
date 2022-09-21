#!/bin/sh
echo $$
t=0

toggle() {
    t=$(((t + 1) % 2))
	xautolock -toggle
}


trap "toggle" USR1

while true; do
    if [ $t -eq 0 ]; then
		echo 
    else
		echo 
    fi
    sleep 60 &
    wait
done
