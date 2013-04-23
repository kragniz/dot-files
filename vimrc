call pathogen#infect() " Load pathogen

set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1       
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set expandtab
set smarttab
set showcmd
set number          " Show line numbers.
set showmatch
set hlsearch
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
set ignorecase
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
set backspace=2
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).function! Chomp(str)
set formatoptions=c,q,r,t
set ruler
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set gdefault        " the /g flag on :s substitutions by default
set background=dark
set mouse=a
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

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

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


set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/

command Kana set keymap=kana
