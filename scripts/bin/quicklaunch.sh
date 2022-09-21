#!/bin/sh

exec ~/bin/rofibin/`ls --color=never ~/bin/rofibin/ | \
	rofi -dmenu -modi run \
	-config ~/.config/rofi/quicklaunchconfig \
	-me-select-entry Shift+F11 -me-accept-entry MousePrimary \
	`

#exec ~/bin/rofibin/`ls -b --color=never ~/bin/rofibin/ | \
#	dmenu \
#	`
