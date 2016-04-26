# sourcing .profile
if [ -r ~/.profile ]; then . ~/.profile; fi

# colors!
mintgreen="\[\033[01;32m\]"
blue="\[\033[01;34m\]"
purple="\[\033[1;35m\]"
reset="\[\033[0m\]"
fg=('\[\e[0;30m\]' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]'
    '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]'
    '\[\e[0;30m\]' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]'
    '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]')
fg=('\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]'
    '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]'
    '\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]'
    '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]')
nofg='\[\e[0m\]'

# BK R  G  Y  B  M  C  W
# 00 01 02 03 04 05 06 07 dark
# 08 09 10 11 12 13 14 15 light

# ALIASES ------------------------
alias ls="ls --color"
alias dkm='sudo $(history -p !!)'
alias reboot='sudo systemctl reboot'
alias pwroff='sudo systemctl poweroff'

# PROMPT -------------------------
# prompt will now show git dirty state
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\$(__git_ps1)' adds git-related stuff
export PS1="${fg[14]}\u${fg[3]}\$(__git_ps1) ${fg[8]}\W$nofg "

# ANDROID STUDIO ------------------
export ANDROID_HOME=/opt/android-sdk

# WM STUFF ----------------------------
#export BSPWM_STATE=/tmp/bspwm-state.json
