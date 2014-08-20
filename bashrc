# If not running interactively, don't do anything
[ -z "$PS1" ] && return


echo
echo
echo -e "\e[0;37m        　　(＾ヽ--\e[0;31m△\e[0m\e[0;37m<＾)\e[0m"
echo -e "\e[0;37m        　 /　　　　　\e[0;31m~▽\e[0m\e[0m"
echo -e "\e[0;37m        　士　0　o　0 士\e[0m"
echo -e "\e[0;37m        　 メ ＿＿＿ メ\e[0m"
echo -e "\e[0;37m        　　　/ へ\`-L、\e[0m"
echo -e "\e[0;37m           (\e[4;37m~(　し′｜ \e[0m\e[1;37m）\e[0m"
echo -e "\e[0;35;5m             かわいい\e[0m"
echo
echo

if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# automatically cd to a directory
shopt -s autocd

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# flush history to the history file before each command and set the prompt
PROMPT_COMMAND='history -a'

if [ -f ~/.bash_prompt ]; then
   source ~/.bash_prompt
fi


eval "`dircolors -b`"
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'

# ls whenever cding to a directory
cd() {
      builtin cd "$@"; ls
  }

mkc() {
    # make dir and enter it
    mkdir "$@" && cd "$@"
}

mkr() {
    # make repo
    mkdir "$@" && cd "$@" && git init
}

function pcat() {
    pygmentize -f terminal256 -O style=tango -g $1
}

alias editor='vim'
alias vi='vim'
alias v='vim'
alias sp='aspell -c'
alias music='mpg123 -ZvC --title --list ~/playlist'
alias qw='chromium' #pls. qw is pretty easy to type
alias p='python'
alias pi='ipython'
alias please='sudo !!'

alias tma='tmux attach -d -t'
alias tmux_='tmux new -s $(basename $(pwd))'

#check your internet connection
alias pingg='ping google.com'

alias aber='ssh lot15@central.aber.ac.uk'
alias devio='ssh lpt@devio.us'
alias 42nd='ssh 42nd.org -t tmux attach'
alias nyaa='ssh nyaa.kragniz.eu -t tmux attach'
alias myaa='mosh nyaa.kragniz.eu'
alias srcf='ssh st435@srcf.net'

alias socks='echo "starting socks server on port 9090..." && ssh -D 9090 -Nf 42nd.org'
alias vpn='\cd /etc/openvpn && sudo openvpn /etc/openvpn/client.ovpn && \cd -'

#be really lazy
alias cp='cp -v'
alias c='cd'
alias c.='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias g='git'
alias gt='git'
alias gd='git diff'
alias gll='git log --stat --graph'
alias gl='git log --graph --all --abbrev-commit --pretty=format:'\''%C(red)%d%x20%C(yellow)%h%x20%C(green)%an%x20 %Creset%s %Cred(%cr)'\'

#pretend I'm in vi
alias ':x'='exit'
alias ':q'='exit'

#debian stuff
alias dquilt="dquilt --quiltrc=${HOME}/.quiltrc-dpkg"
alias update="sudo apt-get update && sudo apt-get dist-upgrade"

command_not_found_handle() {
    bash_check_command "$@"
}

inst() {
    sudo apt-get install $@
}

alias eth="sudo dhclient eth0"

GOPATH=$HOME/go

PATH=$HOME/bin:$GOPATH/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:
# don't put duplicate lines in the history and ignore same sucessive entries.
HISTCONTROL=ignoreboth
EDITOR=vim
export PATH GOPATH HOME TERM EDITOR PROMPT_COMMAND HISTCONTROL

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
