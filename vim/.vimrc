syntax on
set number

filetype plugin on
filetype indent on

set ruler

" Searching
set ignorecase
set smartcase
" Highlight search
set hlsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8

" Set unix as the standard file type
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
