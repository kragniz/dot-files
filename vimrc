set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 1

Plug 'airblade/vim-gitgutter'

Plug 'fatih/vim-go'

Plug 'Shougo/neocomplete.vim'

Plug 'tpope/vim-fugitive'

Plug 'puppetlabs/puppet-syntax-vim'

Plug 'LnL7/vim-nix'

Plug 'rust-lang/rust.vim'

Plug 'bfrg/vim-cpp-enhanced-highlight'

Plug 'vivien/vim-linux-coding-style'

Plug 'ambv/black'

Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2

"set background=light
set background=dark

colorscheme dim

set expandtab
set tabstop=4
set autoindent
set shiftwidth=4
set number

set ttymouse=xterm2
set mouse=a

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:black_virtualenv="~/.vim_black"
autocmd BufWritePre *.py execute ':Black'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

set incsearch
set hlsearch
set showcmd

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
