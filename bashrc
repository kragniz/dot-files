# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

PS1="┌──[\e[0;33m\u\e[0m@\e[0;34m\h\e[0m]─[\e[2;37m\w\e[0m]\n└─\$ "
PS2="└─>"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='egrep --color=auto'
fi

# ls whenever cding to a directory
cd() {
      builtin cd "$@"; ls
  }

mpd() {
    mpd
    pidof mpdscribble >& /dev/null
    if [ $? -ne 0 ]; then
         mpdscribble &
    fi
}

mkc() {
    mkdir "$@" && cd "$@"
}

alias editor='vim'
alias vi='vim'
alias sp='aspell -c'

alias music='mpg123 -ZvC --title --list ~/playlist'

#check your internet connection
alias pingg='ping google.com'

alias aber='ssh lot15@central.aber.ac.uk'
alias devio='ssh lpt@devio.us'
alias 42nd='ssh louis@42nd.org'
alias srcf='ssh st435@srcf.net'

#be really lazy
alias v='vim'
alias c='cd'
alias g='git'
alias gt='git'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

#be super duper lazy
alias up='vol up'
alias down='vol down'
alias mute='vol mute'

#pretend I'm in vi
alias ':x'='exit'
alias ':q'='exit'

#debian stuff
alias dquilt="dquilt --quiltrc=${HOME}/.quiltrc-dpkg"
alias update="sudo apt-get update && sudo apt-get dist-upgrade"

alias eth="sudo dhclient eth0"

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:
# don't put duplicate lines in the history and ignore same sucessive entries.
HISTCONTROL=ignoreboth
# flush history to the history file before each command
PROMPT_COMMAND='history -a'
EDITOR=vim
export PATH HOME TERM EDITOR PROMPT_COMMAND HISTCONTROL

GPGKEY=E13E7098
DEBEMAIL="kragniz@gmail.com"
DEBFULLNAME="Louis Taylor"
export GPGKEY DEBEMAIL DEBFULLNAME

#Have some nice colours in ttys
function c1 {
	if [ "$TERM" = "linux" ]; then
		echo -en "\e]P0060606" # 0
		echo -en "\e]P8191919" # 8

		echo -en "\e]P18A2F58" # 1
		echo -en "\e]P9CF4F88" # 9

		echo -en "\e]P2287373" # 2
		echo -en "\e]PA53A6A6" # 10

		echo -en "\e]P3914E89" # 3
		echo -en "\e]PBBF85CC" # 11

		echo -en "\e]P418618f" # 4
		echo -en "\e]PC1C86C5" # 12

		echo -en "\e]P55E468C" # 5
		echo -en "\e]PD7F62B3" # 13

		echo -en "\e]P68CAFF0" # 6
		echo -en "\e]PE9BBAF1" # 14

		echo -en "\e]P7EDD8D1" # 7
		echo -en "\e]PFFCEDE3" # 15
		clear
	fi
}

function c2 {
	if [ "$TERM" = "linux" ]; then
		echo -en "\e]P01b1d1e" # 0
		echo -en "\e]P8505354" # 8

		echo -en "\e]P1f92672" # 1
		echo -en "\e]P9ff5995" # 9

		echo -en "\e]P282b414" # 2
		echo -en "\e]PAb6e354" # 10

		echo -en "\e]P3fd971f" # 3
		echo -en "\e]PBfeed6c" # 11

		echo -en "\e]P456c2d6" # 4
		echo -en "\e]PC8cedff" # 12

		echo -en "\e]P58c54fe" # 5
		echo -en "\e]PD9e6ffe" # 13

		echo -en "\e]P6465457" # 6
		echo -en "\e]PE899ca1" # 14

		echo -en "\e]P7ccccc6" # 7
		echo -en "\e]PFf8f8f2" # 15
		clear
	fi
}
c2 # apply one of the colour schemes
