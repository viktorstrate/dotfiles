set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'

call vundle#end()

syntax on
set number

filetype plugin indent on

set ruler           " Always show the current position

" Searching
set ignorecase
set smartcase
set incsearch       " search as characters are entered
"set hlsearch       " Highlight search

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching [{()}]

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
