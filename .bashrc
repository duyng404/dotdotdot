# colors!
mintgreen="\[\033[01;32m\]"
blue="\[\033[01;34m\]"
purple="\[\033[1;35m\]"
reset="\[\033[0m\]"


# ALIASES ------------------------
alias ls="ls --color"
alias dkm='sudo $(history -p !!)'
alias reboot='sudo systemctl reboot'
alias pwroff='sudo systemctl poweroff'

# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
# export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"
export TERMINAL="urxvt --background-expr 'align 0.5, 0.5 , keep {merge load \"/home/ferb/a.jpg\", solid \"[90]#000000\"}'"
export PS1="$mintgreen\u$purple\$(__git_ps1)$blue \w \$$reset "


# LEMON BAR ----------------------------
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=20
PANEL_FONT="-*-gohufont-medium-*-*-*-14-*-*-*-*-*-iso10646-1"
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME
