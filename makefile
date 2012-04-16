all: submodules vim bash git scripts icons gnupg debian

submodules:
	git submodule init
	git submodule update

gnupg: submodules
	cp -rav gnupg ~/.gnupg

bash:
	cp -a bashrc ~/.bashrc

vim:
	cp -a vimrc ~/.vimrc
	cp -ra vim ~/.vim

backup:
	date +%R-%F | xargs mkdir
	cp ~/.* backup

git:
	cp -a gitconfig ~/.gitconfig

scripts:
	mkdir -p ~/bin
	cp -a music-playing ~/bin
	cp -a sp ~/bin
	cp -a termtime ~/bin

icons:
	mkdir -p ~/.icons/gnome/25x24/places/
	cp start-here.svg ~/.icons/gnome/24x24/places/start-here.svg

debian:
	cp -a quiltrc-dpkg ~/.quiltrc-dpkg
