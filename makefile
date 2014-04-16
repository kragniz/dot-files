all: ~/.vimrc bash git ~/bin tmux.conf X openbox dmenu mpd irc gitflow python

submodules:
	git submodule init
	git submodule update

gnupg: submodules
	cp -rav gnupg ~/.gnupg

bash: ~/.bashrc ~/.bash_profile ~/.inputrc ~/.bash_prompt

~/.bashrc: bashrc
	cp -a $? $@

~/.bash_profile: bash_profile
	cp -a $? $@

~/.bash_prompt: bash_prompt
	cp -a $? $@

~/.inputrc: inputrc
	cp -a $? $@

~/.vimrc: vimrc vim jedi
	cp -a vimrc ~/.vimrc
	cp -rfavT vim ~/.vim


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

debian:
	cp -a quiltrc-dpkg ~/.quiltrc-dpkg

tmux.conf:
	cp -a tmux ~/.tmux.conf

X:
	cp -a Xdefaults ~/.Xdefaults

openbox:
	mkdir -p ~/.config/openbox
	cp -a openboxrc.xml ~/.config/openbox/rc.xml
	cp -a conkyrc ~/.conkyrc

dmenu:
	cp -a dmenurc ~/.dmenurc

mpd:
	cp -a mpdconf ~/.mpdconf
	mkdir -p ~/.mpdscribble
	cp mpdscribble ~/.mpdscribble/mpdscribble.conf

python:
	cp -a pythonrc ~/.pythonrc.py
	mkdir -p ~/.config/ipython/profile_default
	cp -a ipython ~/.config/ipython/profile_default/ipython_config.py
