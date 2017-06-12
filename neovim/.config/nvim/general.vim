set number

" Add mouse support
set mouse=a

set cursorline      " Highlight current line

set autoread        " Reload files changed outside vim

set relativenumber

" Searching
set ignorecase
set smartcase
set incsearch       " search as characters are entered
"set gdefault        " Never have to type /g at the end of search / replace again
set hlsearch        " Highlight search

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"set showmatch       " highlight matching [{()}]

set encoding=utf8

" Set unix as the standard file type
set ffs=unix,dos,mac

" Don't generate files
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

set shiftwidth=4
set tabstop=4

set ai      " Auto indent
set si      " Smart indent
set wrap    " Wrap lines

set list    " Visible whitespaces

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

func! TrimEndLines()
    exe "normal mz"
    :silent! %s#\($\n\s*\)\+\%$##
    exe "normal Go"
    " Move back to mark z and move view to center of screen
    exe "normal `zzz"
endfunction

autocmd BufWrite * call DeleteTrailingWS()
autocmd BufWrite *.py,*.js,*.jsx,*.vim call TrimEndLines()

