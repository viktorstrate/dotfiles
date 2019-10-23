" Check if plugged is installed and install if not
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setup plugged

call plug#begin('~/.local/share/nvim/plugged')

" Nerdtree {{{1
" File tree view
Plug 'scrooloose/nerdtree'
" TODO here
Plug 'Xuyuanp/nerdtree-git-plugin'        " Plugin for git

" Autocomplete {{{1
" Make sure neovim has python3 support
" Check with this command :echo has("python3")

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto completion
" The newest version of deoplete wasn't working, so i am using release 3.0
let g:plugs['deoplete.nvim'].commit = 'ac4e8b5'
Plug 'ervandew/supertab'
Plug 'Shougo/neoinclude.vim'
if (executable('node'))
    Plug 'carlitux/deoplete-ternjs'
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
endif
Plug 'zchee/deoplete-clang'               " C/C++ autocomplete
Plug 'Shougo/neco-vim'                    " Vimscript autocomplete

" Python autocomplete
if (executable('python'))
    Plug 'zchee/deoplete-jedi'
endif

" ZSH autocomplete
if (executable('zsh'))
    Plug 'zchee/deoplete-zsh'
endif

" Haskell autocomplete
if (executable('ghc'))
    Plug 'eagletmt/neco-ghc'
endif

Plug 'racer-rust/vim-racer'

" Snippets {{{3
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Airline {{{1
Plug 'bling/vim-airline'                  " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'     " Themes for airline

" Git {{{1
Plug 'tpope/vim-fugitive'                 " Git
Plug 'tpope/vim-rhubarb'                  " Github plugin for fugitive
Plug 'airblade/vim-gitgutter'

" Search {{{1
if (executable('ack'))
    Plug 'mileszs/ack.vim'
endif

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Plug 'wincent/command-t', {
" \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
" \ }

" Ale {{{1
Plug 'w0rp/ale'

" Neomake {{{1
" Plug 'benekastah/neomake'                 " Async :make and linting framework
"Plug 'benjie/neomake-local-eslint.vim'    " Prefer local repo install of eslint over global install
" Plug 'jaawerth/neomake-local-eslint-first'

" Javascript {{{1
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }

" C/C++ {{{1
Plug 'vim-scripts/a.vim', { 'for': 'cpp' } " For header switching
" Plug 'vim-scripts/ccimpl.vim'
" Plug 'derekwyatt/vim-protodef', { 'for': 'cpp' }
" Plug 'LucHermitte/lh-cpp', { 'for': 'cpp' }
" Plug 'LucHermitte/lh-vim-lib', { 'for': 'cpp' }
" Plug 'LucHermitte/lh-brackets', { 'for': 'cpp' }
" Plug 'LucHermitte/lh-style', { 'for': 'cpp' }
" Plug 'LucHermitte/lh-dev', { 'for': 'cpp' }
" Plug 'LucHermitte/mu-template', { 'for': 'cpp' }
" " Plug 'LucHermitte/VimFold4C', { 'for': 'cpp' }
" Plug 'LucHermitte/alternate-lite', { 'for': 'cpp' }

" Haskell {{{1
Plug 'neovimhaskell/haskell-vim'

" Rust {{{1
if (executable('rustc'))
    Plug 'rust-lang/rust.vim'
endif

if (executable('cargo'))
    Plug 'timonv/vim-cargo'
endif

" Markdown {{{1
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }

let g:multi_cursor_next_key='<M-n>'

" Latex {{{1
if (executable('pdflatex'))
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'donRaphaco/neotex', { 'for': 'tex', 'do': ':UpdateRemotePlugins' }
endif

" tpope {{{1
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'                 " A universal set of defaults that (hopefully) everyone can agree on.
Plug 'tpope/vim-eunuch'                   " Unix commands
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/tpope-vim-abolish'            " Easier search, abbreviation and coersion
Plug 'tpope/vim-repeat'                   " Plugin wise dot repeat
"Plug 'tpope/vim-vinegar'                  " Relative file navigator


" Misc {{{1
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chriskempson/base16-vim'            " Color schemes
Plug 'sheerun/vim-polyglot'               " A large collection of language packs, syntax, auto-indent, ftplugins
Plug 'junegunn/goyo.vim'                  " Distraction-free writing in Vimlet g:user_emmet_leader_key = '<C-y>'.
Plug 'jiangmiao/auto-pairs'               " Auto match brackets in insert mode
Plug 'gko/vim-coloresque'                 " Highlight colors in CSS
Plug 'nelstrom/vim-visual-star-search'    " Same as pressing * over a word, but for a selection
Plug 'ryanoasis/vim-devicons'             " Icons, requires patched font https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
"Plug 'terryma/vim-multiple-cursors'       " Multiple cursors
Plug 'qpkorr/vim-bufkill'                 " Close buffers without closing split

" }}}

call plug#end()

