#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch the bars on all monitor
#all_monitors=$(xrandr -q | awk '/ connected/ {print $1}')
#for monitor in $all_monitors; do
#	export MONITOR=$monitor && polybar baru &
#done

rm ~/tmp/polybar-*.log
polybar main 2>&1 | tee -a ~/tmp/polybar-main.log & disown
polybar sub 2>&1 | tee -a ~/tmp/polybar-sub.log & disown

echo "Polybar launched ..."
