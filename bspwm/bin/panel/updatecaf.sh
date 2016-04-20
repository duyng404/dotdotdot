#/bin/sh
state=`caff.sh -s`
if [[ $state == "on" ]]; then
	indicator="\ue1c2"
else
	indicator="\ue1bc"
fi
printf "%s\n" "A$indicator" > "$PANEL_FIFO"
