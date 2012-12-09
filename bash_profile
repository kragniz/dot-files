if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

source ~/bin/git-flow-completion.sh

export PATH="$HOME/.rbenv/bin:$PATH"
if [ -f ~/.rbenv/bin/rbenv ]; then
    eval "$(rbenv init -)"
fi
