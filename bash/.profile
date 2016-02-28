#path
PATH=~/bin/:$PATH
PATH=~/bin/panel:$PATH

# MPD daemon start
[ ! -s ~/.mpd/pid ] && mpd
