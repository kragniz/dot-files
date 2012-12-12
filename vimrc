call pathogen#infect() " Load pathogen

set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1       
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).function! Chomp(str)
 
set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                        " automatic formatting is to be done.
                        "
                        " letter    meaning when present in 'formatoptions'
                        " ------    ---------------------------------------
                        " c         Auto-wrap comments using textwidth, inserting
                        "           the current comment leader automatically.
                        " q         Allow formatting of comments with "gq"." 
                        " r         Automatically insert the current comment leader
                        "           after hitting <Enter> in Insert mode. 
                        " t         Auto-wrap text using textwidth (does not apply
                        "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set gdefault        " the /g flag on :s substitutions by default

" set background=dark
"
set mouse=a         " Enable the use of the mouse.

set so=4            " Add a scrolloff number of lines above and below the cursor

set dict=/usr/share/dict/words
set complete-=k complete+=k

"set ofu=syntaxcomplete#Complete
set completeopt=menuone,longest,preview

" 
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

"set completeopt=longest,menuone

filetype plugin indent on
syntax on

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
