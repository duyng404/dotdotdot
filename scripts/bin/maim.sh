#!/bin/bash
if [ "$1" == "-s" ]; then
	maim -s ~/usr/img/scrot/$(date +%Y-%m-%d-%H%M%S).png
else
	maim ~/usr/img/scrot/$(date +%Y-%m-%d-%H%M%S).png
fi
