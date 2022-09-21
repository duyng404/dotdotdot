#/bin/bash

query_status () {
	if [[ -n `xset q | grep "DPMS is Enabled"` ]]; then
		echo 
	else
		echo 
	fi
}

toggle() {
	if [[ "$(query_status)" == "" ]]; then
		xset s 0 -dpms
	else
		xset s 600 +dpms
	fi
}

trap "toggle" USR1

while true; do
	echo $(query_status)
    sleep 60 &
	wait
done
