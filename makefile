all: vi bash git scripts icons tmux X openbox dmenu mpd

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
	cp -va script/* ~/bin
	
icons:
	mkdir -p ~/.icons/gnome/24x24/places/
	cp start-here.svg ~/.icons/gnome/24x24/places

debian:
	cp -a quiltrc-dpkg ~/.quiltrc-dpkg

tmux:
	cp -a tmux.conf ~/.tmux.conf

X:
	cp -a Xdefaults ~/.Xdefaults

openbox:
	mkdir -p ~/.config/openbox
	cp -a autostart ~/.config/openbox/autostart
	cp -a openboxrc.xml ~/.config/openbox/rc.xml
	cp -a conkyrc ~/.conkyrc

dmenu:
	cp -a dmenurc ~/.dmenurc

mpd:
	cp -a mpdconf ~/.mpdconf
	mkdir -p ~/.mpdscribble
	cp mpdscribble ~/.mpdscribble/mpdscribble.conf

initmpd:
	mkdir -p ~/.mpd/playlists
	touch ~/.mpd/mpd.db
	touch ~/.mpd/mpd.log
	touch ~/.mpd/mpd.pid
	touch ~/.mpd/mpdstate
