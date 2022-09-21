#!/bin/sh

# run this script for a list of installed packages sorted by size (only show those in MiB)

paste <(pacman -Q | awk '{ print ; }' | xargs pacman -Qi | grep 'Size' | awk '{ print ; }') <(pacman -Q | awk '{print ; }') | sort -n | column -t | grep MiB
