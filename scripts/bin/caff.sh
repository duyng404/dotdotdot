#/bin/sh

query_status () {
	if [[ -n `xset q | grep "DPMS is Enabled"` ]]; then
		echo "off"
	else
		echo "on"
	fi
}

if [[ $1 == "-s" ]]; then
	echo $(query_status)
elif [[ $1 == "-t" ]]; then   # toggle the state
	if [[ "$(query_status)" == "off" ]]; then
		xset s 0 -dpms
	else
		xset s 600 +dpms
	fi
fi
