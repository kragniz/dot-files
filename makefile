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
	mkdir ~/bin
	cp -a music-playing ~/bin
