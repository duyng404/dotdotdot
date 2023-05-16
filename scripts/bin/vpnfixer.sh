#!/bin/bash

# this script detect if the active openvpn3 connection is dead. If it is, attempt to disconnect. Also check if there is no vpn but there are leftover of dns config and attempt to fix the dns (resolv.conf)

while true
do
	isUsingVpn=`openvpn3 sessions-list | grep Status`
	vpnDisconnected=`openvpn3 sessions-list | grep Status | grep disconnected`
	if [ -n "$isUsingVpn" ]; then
		if [ -n "$vpnDisconnected" ]; then
			echo "vpn is faulty, disconnecting"
			/home/rei/bin/disconnectvpn.py
		else
			echo "vpn is fine"
		fi
	else
		if head -n 4 /etc/resolv.conf | grep -q '10\.40\.20\.50'; then
			echo "leftover resolv.conf nameserver, trying disconnect script"
			if [ -s "/etc/resolv.conf" ]; then
				/home/rei/bin/disconnectvpn.py
			else
				echo "faulty resolv.conf, symlinking"
				ln -sf /run/resolvconf/resolv.conf /etc/resolv.conf
			fi
		else 
			echo "vpn down, resolv.conf normal"
		fi
	fi
	sleep 10
done
