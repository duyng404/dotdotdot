#!/bin/sh
bspc rule -a chromium -o desktop=^7 state=pseudo_tiled && /usr/bin/chromium --profile-directory=Default --app-id=hmjkmjkepdijhoojdojkdfohbdgmmhki
