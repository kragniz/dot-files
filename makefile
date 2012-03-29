all: vim bash

bash:
	cp -rav .bashrc ~

vim:
	cp -rav .vimrc ~

backup:
	date +%R-%F | xargs mkdir
	cp ~/.* backup
