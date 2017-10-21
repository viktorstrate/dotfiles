" Check if plugged is installed and istall if not
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
Plug 'ervandew/supertab'
Plug 'Shougo/neoinclude.vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'zchee/deoplete-clang'               " C/C++ autocomplete
Plug 'Shougo/neco-vim'                    " Vimscript autocomplete
Plug 'zchee/deoplete-jedi'                " Python autocomplete
Plug 'zchee/deoplete-zsh'                 " ZSH autocomplete

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
Plug 'mileszs/ack.vim'
Plug 'wincent/command-t', {
\   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
\ }

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

" Markdown {{{1
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }

"Multiple cursors  {{{1
let g:multi_cursor_next_key='<M-n>'

" Latex {{{1
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'donRaphaco/neotex', { 'for': 'tex', 'do': ':UpdateRemotePlugins' }

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
Plug 'terryma/vim-multiple-cursors'       " Multiple cursors

call plug#end()

