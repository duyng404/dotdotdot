# WAL COLORS ----------------------
# Import colorscheme from 'wal'
cat ~/.cache/wal/sequences

# sourcing ubuntu's default bashrc
if [ -r ~/.oldbashrc ]; then . ~/.oldbashrc; fi

# aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
export PS1="${debian_chroot:+($debian_chroot)}${fg[06]}\u${fg[03]}\$(__git_ps1) ${fg[01]}\W$nofg "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export DOCKER_BUILDKIT=1
export PYENV_ROOT="$HOME/.pyenv"
PATH="$HOME/.pyenv/bin:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.local/bin:$PATH"
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
