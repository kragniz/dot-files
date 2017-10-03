set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 1

Plug 'airblade/vim-gitgutter'

call plug#end()

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2

set background=dark
