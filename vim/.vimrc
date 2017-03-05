" Change leader
let mapleader = "<"

" ### Vundle start

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'                " File tree view
Plugin 'bling/vim-airline'                  " Lean & mean status/tabline
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
Plugin 'tpope/vim-fugitive'                 " Git
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'               " File linting / error checker
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'valloric/youcompleteme'             " Auto completion
Plugin 'kien/ctrlp.vim'                     " Path fyzzy file, buffer, mru, tag... finder
Plugin 'flazz/vim-colorschemes'             " For color schemes

" Syntax highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()

" ### Plugin configs
" NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

" Emmet vim
let g:user_emmet_leader_key='<leader><leader>'

" Syntastic
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let syntastic_loc_list_height=4

" Checkers
let g:syntastic_javascript_checkers = ['eslint', 'standard']

" .jsx
let g:jsx_ext_required = 0

" Airline
set laststatus=2

" Theme
colorscheme slate

" ### Vanilla vim configs

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

" Resizing
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Searching
set ignorecase
set smartcase
set incsearch       " search as characters are entered
set gdefault        " Never have to type /g at the end of search / replace again
set hlsearch        " Highlight search
" Stop highlight after searching
nnoremap <silent> <leader>, :noh<cr>

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

" Allow usage of mouse
set ttyfast
set mouse=a
