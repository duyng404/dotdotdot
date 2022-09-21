#!/bin/sh

# re-launch compton anytime by running killall -USR1 comptonlauncher.sh anywhere

ffff() {
	compton -b
}

trap "ffff" USR1

while true; do
	sleep 1
done
