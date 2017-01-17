" ### Vundle start

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'valloric/youcompleteme'

" Syntax highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()

" ### Plugin configs
" NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

" Syntastic
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Checkers
let g:syntastic_javascript_checkers = ['eslint', 'standard']

" .jsx
let g:jsx_ext_required = 0

" ### Vanilla vim configs

syntax on
set number
" colorscheme gruvbox

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
