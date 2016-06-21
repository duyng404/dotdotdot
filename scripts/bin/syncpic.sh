#!/bin/sh
if test -z "$1"
then
	# no remote specified
	rsync -auP --delete ferb@Junketsu:~/usr/music/ ~/usr/music/
else
	rsync -auP --delete "$1:~/usr/music/" ~/usr/music/
fi
