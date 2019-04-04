" General ------------------------------ {{{1
" Add mouse support
set mouse=a
set number
set cursorline      " Highlight current line
set autoread        " Reload files changed outside vim
set relativenumber
set number

filetype plugin indent on

" A function in colors.vim handles this more enlegantly
" set colorcolumn=81

"set showmatch       " highlight matching [{()}]
set encoding=utf8
" Set unix as the standard file type
set ffs=unix,dos,mac
set hidden
set undofile
set breakindent
set scrolloff=3                 " Start scrolling 3 characters before edge
set shell=bash
nnoremap Q <Nop>

set list                        " Visible whitespaces
set listchars+=trail:•
set listchars+=tab:>-

set switchbuf=useopen
set virtualedit=block

" Add support for project-based .nvimrc or .exrc initialization files
set exrc
set secure

if exists('$SUDO_USER')
    set nobackup
    set nowritebackup
    set noswapfile
    set noundofile
else
    " Swap
    set directory=/.local/share/nvim/swap//
    set directory+=/tmp/.nvim/swap//
    set swapfile

    set undodir=/.local/share/nvim/undo
    set undodir+=/tmp/.nvim/undo
    set undofile
endif

set wildignore+=*.o,*.obj

" Search ------------------------------ {{{1
set ignorecase
set smartcase
set incsearch       " search as characters are entered
"set gdefault        " Never have to type /g at the end of search / replace again
set hlsearch        " Highlight search

" Interactive substitute
set icm=split

" Tabs and spaces ------------------------------ {{{1
set expandtab

" 0 = same as tabstop
set shiftwidth=0
" Number of spaces that a <Tab> counts for.
set tabstop=4
" Number of spaces <Tab> counts for when performing edits like deleting tabs
set softtabstop=4

set showbreak=>++
set breakindentopt=shift:2

" Folds ------------------------------ {{{1
set foldmethod=marker
set foldcolumn=1
noremap <tab> za
