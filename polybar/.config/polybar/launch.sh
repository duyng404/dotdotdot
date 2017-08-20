#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch the bars
all_monitors=$(xrandr -q | awk '/ connected/ {print $1}')
for monitor in $all_monitors; do
	export MONITOR=$monitor && polybar baru &
done

