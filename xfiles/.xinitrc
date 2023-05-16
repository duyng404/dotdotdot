#!/bin/bash

# merge in defaults and keymaps
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# emergency x shutdown
setxkbmap -option terminate:ctrl_alt_bksp

# Initialize screen config
#initscreens.sh

# Set the friggin numlock
#numlockx &

# Set default cursor to not be X-shaped
xsetroot -cursor_name left_ptr&

# Notification server
#dunst &

# Start ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

# Trackpoint middle button scroll
#tpset() { xinput set-prop "TPPS/2 IBM TrackPoint" "$@"; }
#tpset "Evdev Wheel Emulation" 1
#tpset "Evdev Wheel Emulation Button" 2
#tpset "Evdev Wheel Emulation Timeout" 200
#tpset "Evdev Wheel Emulation Axes" 6 7 4 5
#tpset "Device Accel Constant Deceleration" 1
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 1
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Timeout" 50

# fix gnome-keyring idk why
#. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# check if existing socket exists and killl for bspwm(doesn't play nice with logging out and in)
# I don't know why I had this in tbh
rm /tmp/$(ls /tmp | grep bspwm)

# MPD
#if [ -z "`ps -aux | grep [m]pd`" ] && [ -S ~/.mpd/socket ]; then pkill mpd; rm ~/.mpd/socket; mpd; fi
#if [ -z "`ps -aux | grep [m]pd`" ] && [ ! -S ~/.mpd/socket ]; then pkill mpd; mpd; fi

# mopidy
#if [ -z "`ps -aux | grep [m]opidy`" ]; then mopidy & fi

# Delete annoying folder
#[ -d ~/Downloads ] && rm -r ~/Downloads
#[ -d ~/Desktop ] && rm -r ~/Desktop

# Thunar daemon for detect hot plugs of hard drive / usb drive
#thunar --daemon &

# Protect yer eyes at night
#redshift -t 6500:4000 &

# Restore wal colorschemes
#wal -i "$(< "${HOME}/.cache/wal/wal")" -a 90
#wal -f ~/dot/walcolors -a 90

# set up autolock
#xautolock -time 15 -locker i3lock.sh &

# WM
#compton -b
#sxhkd &
#exec bspwm
