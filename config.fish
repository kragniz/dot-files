function fish_greeting
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
end

function vi
    vim $argv
end

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
