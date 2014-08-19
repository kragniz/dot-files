#!/bin/bash

sudo apt-get install git tmux vim-nox

git clone https://github.com/kragniz/dot-files.git
cd dot-files
make
