all: vim bash

bash:
	cp -av .bashrc ~

vim:
	cp -av .vimrc ~
	cp -rav .vim ~

backup:
	date +%R-%F | xargs mkdir
	cp ~/.* backup
