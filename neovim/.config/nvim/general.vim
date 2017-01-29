syntax on
set number
" colorscheme gruvbox
set t_Co=256        " Enable 256 colors

filetype plugin indent on

set ruler           " Always show the current position
set cursorline      " Highlight current line

set autowrite       " Automatically :write before running commands
set autoread        " Reload files changed outside vim

set relativenumber

" Searching
set ignorecase
set smartcase
set incsearch       " search as characters are entered
set gdefault        " Never have to type /g at the end of search / replace again
set hlsearch        " Highlight search

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set wildmenu        " visual autocomplete for command menu
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
set smarttab

set shiftwidth=4
set tabstop=4

set ai      " Auto indent
set si      " Smart indent
set wrap    "Wrap lines

" Remove escape delay
set timeoutlen=1000 ttimeoutlen=0

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
