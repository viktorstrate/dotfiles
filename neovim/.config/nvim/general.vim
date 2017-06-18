" Neovim specefic
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set termguicolors

"exec 'Guifont DejaVuSansMono Nerd Font:h11'


" Folding {{{1
set foldmethod=marker
set foldcolumn=1
noremap <Space> za


" General sets {{{1
" Add mouse support
set mouse=a
set number
set cursorline      " Highlight current line
set autoread        " Reload files changed outside vim
set relativenumber
set number
"set showmatch       " highlight matching [{()}]
set encoding=utf8
" Set unix as the standard file type
set ffs=unix,dos,mac
"set list    " Visible whitespaces
set hidden
set undofile

" Searching {{{1
set ignorecase
set smartcase
set incsearch       " search as characters are entered
"set gdefault        " Never have to type /g at the end of search / replace again
set hlsearch        " Highlight search

" No annoying sound on errors {{{1
set noerrorbells
set visualbell
set t_vb=
set tm=500


" Use spaces instead of tabs {{{1
set expandtab

" 0 = same as tabstop
set shiftwidth=0
" Number of spaces that a <Tab> counts for.
set tabstop=4
" Number of spaces <Tab> counts for when performing edits like deleting tabs
set softtabstop=4

" Indentation {{{2
set ai      " Auto indent
set si      " Smart indent
set wrap    " Wrap lines
set showbreak=>

" Filetype specefic {{{1
autocmd FileType javascript setlocal tabstop=2 softtabstop=2

" Functions {{{1
func! DeleteTrailingWS()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunc

autocmd BufWrite * call DeleteTrailingWS()

