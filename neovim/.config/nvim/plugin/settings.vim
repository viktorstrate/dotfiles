" General ------------------------------ {{{1
" Add mouse support
set mouse=a
set number
set cursorline      " Highlight current line
set autoread        " Reload files changed outside vim
set relativenumber
set number

" A function in colors.vim handles this more enlegantly
" set colorcolumn=81

"set showmatch       " highlight matching [{()}]
set encoding=utf8
" Set unix as the standard file type
set ffs=unix,dos,mac
"set list    " Visible whitespaces
set hidden
set undofile

" For swap files
set directory+=/tmp

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

" Folds ------------------------------ {{{1
set foldmethod=marker
set foldcolumn=1
noremap <tab> za
