all: vim bash git scripts

bash:
	cp -a .bashrc ~

vim:
	cp -a .vimrc ~
	cp -ra .vim ~

backup:
	date +%R-%F | xargs mkdir
	cp ~/.* backup

git:
	cp -a .gitconfig ~

scripts:
	mkdir -p ~/bin
	cp -a music-playing ~/bin
	cp -a sp ~/bin
	cp -a termtime ~/bin
