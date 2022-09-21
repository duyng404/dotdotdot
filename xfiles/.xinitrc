#!/bin/bash

# merge in defaults and keymaps
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -f $sysresources ]; then
	touch ~/lmao.tmp
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

# Set default cursor to not be X-shaped
xsetroot -cursor_name left_ptr&

# Notification server
dunst &

# Start ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

# Network Manager tray applet
nm-applet &

# Bluetooth tray applet
blueman-applet &

# cadence // jack // audio
cadence-session-start -s
cadence --minimized &

# Mouse settings that is not available in xorgconf
#xinput set-prop "Synaptics TM3072-003" "libinput Natural Scrolling Enabled" 1
xinput set-prop "Synaptics TM3072-003" "libinput Disable While Typing Enabled" 0

# fix gnome-keyring idk why
#. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# MPD
#if [ -z "`ps -aux | grep [m]pd`" ] && [ -S ~/.mpd/socket ]; then pkill mpd; rm ~/.mpd/socket; mpd; fi
#if [ -z "`ps -aux | grep [m]pd`" ] && [ ! -S ~/.mpd/socket ]; then pkill mpd; mpd; fi

# mopidy
#if [ -z "`ps -aux | grep [m]opidy`" ]; then mopidy & fi

# Delete annoying folder
[ -d ~/Downloads ] && rm -r ~/Downloads
[ -d ~/Desktop ] && rm -r ~/Desktop

# Thunar daemon for detect hot plugs of hard drive / usb drive
#thunar --daemon &

# Protect yer eyes at night
redshift -t 6500:4500 -l 20.9:105.8 &

# set up autolock
xautolock -time 15 -locker i3lock.sh &

# WM
# compositorlauncher.sh &
compton -b
sxhkd &
exec bspwm
