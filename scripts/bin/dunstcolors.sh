

#!/bin/sh

#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
# 
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
# 
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.

[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

pidof dunst && killall dunst

dunst -lf  "$color7" \
      -lb  "$color0" \
      -lfr "$color8" \
      -nf  "$color7" \
      -nb  "$color0" \
      -nfr "$color1" \
      -cf  "$color4" \
      -cb  "$color0" \
      -cfr "$color4" > /dev/null 2>&1 &
