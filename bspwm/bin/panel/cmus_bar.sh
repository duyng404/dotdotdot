#!/bin/sh
state=`cmus-remote -Q | grep status | cut -d " " -f 2`
#current=`cmus-remote -C "format_print '%{?A?%A?a} - %t'"`
current=`cmus-remote -Q | grep title | cut -d " " -f 3-`
current="`cmus-remote -Q | grep albumartist | cut -d " " -f 3-` - $current"
if [[ $state == "playing" ]]; then
	indicator="U"
else
	indicator="P"
fi
printf "%s\n" "U$indicator$current" > "$PANEL_FIFO"
