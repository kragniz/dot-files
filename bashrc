# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

PS1="┌──[\e[0;33m\u\e[0m@\e[0;34m\h\e[0m]─[\e[2;37m\w\e[0m]\n└─\$ "
PS2="└─>"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

alias vi='vim'
alias sp='aspell -c'

#be really lazy
alias v='vim'
alias c='cd'
alias l='ls'
alias g='git'
alias gt='git'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

#pretend I'm in vi
alias ':x'='exit'
alias ':q'='exit'

#debian stuff
alias dquilt="dquilt --quiltrc=${HOME}/.quiltrc-dpkg"
alias update="sudo apt-get update && sudo apt-get dist-upgrade"

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:
GPGKEY=E13E7098
DEBEMAIL="kragniz@gmail.com"
DEBFULLNAME="Louis Taylor"

export PATH HOME TERM GPGKEY DEBEMAIL DEBFULLNAME
