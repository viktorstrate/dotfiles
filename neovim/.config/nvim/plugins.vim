" Check if plugged is installed and istall if not
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setup vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'                " File tree view

"### Autocomplete
" Make sure neovim has python3 support
" Check with this command :echo has("python3")
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto completion
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-clang'

"### Airline
Plug 'bling/vim-airline'                  " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'     " Themes for airline

"### Git
Plug 'tpope/vim-fugitive'                 " Git
Plug 'tpope/vim-rhubarb'                  " Github plugin for fugitive
Plug 'airblade/vim-gitgutter'

"### Neomake
Plug 'benekastah/neomake'                 " Async :make and linting framework
Plug 'benjie/neomake-local-eslint.vim'    " Prefer local repo install of eslint over global install
Plug 'marijnh/tern_for_vim'               " Javascript Tern support

"### Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"### Misc
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'                     " Path fyzzy file, buffer, mru, tag... finder
Plug 'flazz/vim-colorschemes'             " For color schemes
Plug 'sheerun/vim-polyglot'               " A large collection of language packs, syntax, auto-indent, ftplugins
Plug 'junegunn/goyo.vim'                  " Distraction-free writing in Vimlet g:user_emmet_leader_key = '<C-y>'.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'                 " A universal set of defaults that (hopefully) everyone can agree on.

call plug#end()

" Configure plugins
" NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" Emmet vim
let g:user_emmet_leader_key = '<M-y>'
imap ½ <plug>(emmet-expand-abbr)

" Ctrl-P
let g:ctrlp_working_path_mode = 'a'

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" Airline
set laststatus=2

" Goyo
noremap <Leader>g :Goyo<CR>

" Theme
"colorscheme slate      " Dark theme
colorscheme Tomorrow    " Light theme

" ## Neovim plugin configurations
" Use deoplete, for autocomplete
call deoplete#enable()

"Add extra filetypes to tern
let g:tern#filetypes = ['jsx']

" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

