call pathogen#infect() " Load pathogen

set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1       
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set expandtab
set smarttab
set showcmd
set number
set relativenumber
set showmatch
set hlsearch

set incsearch
set ignorecase
set smartcase
set backspace=2
set autoindent

" (typing <CR> in Insert mode or when using the "o" or "O"
" command).function! Chomp(str)
set formatoptions=c,q,r,t
set ruler
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set gdefault        " the /g flag on :s substitutions by default
set background=dark
set mouse=a
set so=4

set textwidth=79    " Maximum width of text that is being inserted.

filetype plugin indent on
syntax on

" don't expand tabs in go files
au BufRead,BufNewFile *.go set noexpandtab
" Fmt go files on every save
autocmd FileType go autocmd BufWritePre <buffer> Fmt

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Highlight current word
highlight flicker cterm=bold ctermfg=white
au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'

" use C-j and C-k to move lines up and down in:
" normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

set dict=/usr/share/dict/words
set complete-=k complete+=k

"set ofu=syntaxcomplete#Complete
set completeopt=menuone,longest,preview

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
highlight Pmenu ctermfg=grey ctermbg=darkgrey

set rtp+=$GOROOT/misc/vim

"save a file as root. Use :w!! and vim will ask you for your password
ca w!! w !sudo tee >/dev/null "%"

function! Chomp(str)
    return substitute(a:str, '\n$', '', '')
endfunction

function! DmenuOpen(cmd)
    let fname = Chomp(system("gitfilepicker"))
    if empty(fname)
        return
    endif
    execute a:cmd . " " . fname
endfunction

" use ctrl-t to open file in a new tab
" use ctrl-f to open file in current buffer
map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>

highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/

command Kana set keymap=kana

function! Notes()
    split $HOME/.hyoki/notes
endfunction
map <C-n> :call Notes()<CR>
