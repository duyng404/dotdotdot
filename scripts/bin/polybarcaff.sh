#!/bin/bash
. ~/.cache/wal/colors.sh
query_status () {
	if [[ -n `xset q | grep "DPMS is Enabled"` ]]; then
		echo "off"
	else
		echo "on"
	fi
}

if [[ $1 == "-s" ]]; then
    if [[ "$(query_status)" == "off" ]]; then
		echo "%{B$color0 +u}%{A:polybarcaff.sh -t:} ﯈ %{A}%{B-}"
	else
		echo "%{B$color0 +u}%{A:polybarcaff.sh -t:}  %{A}%{B-}"
	fi
elif [[ $1 == "-t" ]]; then   # toggle the state
	if [[ "$(query_status)" == "off" ]]; then
		xset s 0 -dpms
        polybarcaff.sh -s
	else
		xset s 600 +dpms
        polybarcaff.sh -s
	fi
fi
