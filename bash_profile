if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

export PATH="$HOME/.rbenv/bin:$PATH"
if [ -f ~/.rbenv/bin/rbenv ]; then
    eval "$(rbenv init -)"
fi
