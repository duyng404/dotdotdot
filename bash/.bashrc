# sourcing .profile
if [ -r ~/.profile ]; then . ~/.profile; fi

# sourcing ubuntu's default bashrc
if [ -r ~/.oldbashrc ]; then . ~/.oldbashrc; fi

# EZ COLOR ------------------------
# bg is non-bold colors
bg=('\[\e[0;30m\]' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]'
    '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]'
    '\[\e[0;30m\]' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]'
    '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]')
# fg is bold colors
fg=('\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]'
    '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]'
    '\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]'
    '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]')
nofg='\[\e[0m\]'

# BK R  G  Y  B  M  C  W
# 00 01 02 03 04 05 06 07 dark
# 08 09 10 11 12 13 14 15 light

# PROMPT -------------------------
# prompt will now show git dirty state
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\$(__git_ps1)' adds git-related stuff
export PS1="${fg[06]}\u${fg[12]}\$(__git_ps1) ${fg[3]}\W$nofg "

# WAL COLORS ----------------------
# Import colorscheme from 'wal'
(wal -r &)

# AUTOCOMPLETE ---------------------
_codeComplete()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(find bin/ -name '*.class' -exec basename {} .class \;)" -- $cur) )
}

# beets completion
#eval "$(beet completion)"

#complete -F _codeComplete allrun.sh
#complete -F _codeComplete run.sh

# ALIASES ------------------------
alias ls="ls --color"
alias la="ls -la"
alias dkm='sudo $(history -p !!)'
alias firefox='env GTK_THEME=Arc firefox'
#alias reboot='sudo systemctl reboot'
#alias pwroff='sudo systemctl poweroff'

# MPD HOST ------------------------
# when use mopidy
# export MPD_HOST=127.0.0.1
# export MPD_PORT=6600
# normal mpd
export MPD_HOST=~/.mpd/socket
