all: vi bash git scripts icons tmux X xmonad

submodules:
	git submodule init
	git submodule update

gnupg: submodules
	cp -rav gnupg ~/.gnupg

bash:
	cp -a bashrc ~/.bashrc
	cp -a inputrc ~/.inputrc

vi:
	cp -a vimrc ~/.vimrc
	cp -rav vim ~/.vim

git:
	cp -a gitconfig ~/.gitconfig

scripts:
	mkdir -p ~/bin
	cp -a music-playing ~/bin
	cp -a sp ~/bin
	cp -a termtime ~/bin
	cp -a vol ~/bin

icons:
	mkdir -p ~/.icons/gnome/24x24/places/
	cp start-here.svg ~/.icons/gnome/24x24/places

debian:
	cp -a quiltrc-dpkg ~/.quiltrc-dpkg

tmux:
	cp -a tmux.conf ~/.tmux.conf
	cmake tmux-mem-cpu-load
	make -C tmux-mem-cpu-load all
	cp -a tmux-mem-cpu-load/tmux-mem-cpu-load ~/bin/tmux-mem-cpu-load

X:
	cp -a Xdefaults ~/.Xdefaults

xmonad:
	mkdir -p ~/.xmonad
	cp xmonad.hs ~/.xmonad
