all: vim bash git scripts icons

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

icons:
	mkdir -p ~/.icons/gnome/25x24/places/
	cp start-here.svg ~/.icons/gnome/24x24/places/start-here.svg
