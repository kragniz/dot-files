all: ~/.vimrc bash git ~/bin icons tmux X openbox dmenu mpd irc gitflow python

submodules:
	git submodule init
	git submodule update

gnupg: submodules
	cp -rav gnupg ~/.gnupg

bash:
	cp -a bashrc ~/.bashrc
	cp -a inputrc ~/.inputrc
	cp -a bash_profile ~/.bash_profile

~/.vimrc: vimrc vim jedi
	cp -a vimrc ~/.vimrc
	cp -rfavT vim ~/.vim

jedi:
	git clone https://github.com/davidhalter/jedi.git
	cd jedi; python setup.py install --user
	mkdir -p vim/bundle
	cd vim/bundle; rm -rfv jedi-vim; git clone https://github.com/davidhalter/jedi-vim.git

git:
	cp -a gitconfig ~/.gitconfig

gitflow:
	git clone --recursive git://github.com/nvie/gitflow.git
	make -C gitflow install prefix=$$HOME

~/bin: bin
	mkdir -p ~/bin
	cp -va bin/* ~/bin

irc:
	mkdir -p ~/.irssi/scripts/autorun
	cp -arv irssi/autorun ~/.irssi/scripts
	cp irssi/startup ~.irssi
	
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

python:
	cp -a pythonrc ~/.pythonrc.py
	mkdir -p ~/.config/ipython/profile_default
	cp -a ipython ~/.config/ipython/profile_default/ipython_config.py

ratpoison:
	cp -a ratpoisonrc ~/.ratpoisonrc
