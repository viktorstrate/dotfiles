" Check if plugged is installed and istall if not {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setup vim-plug {{{1
call plug#begin('~/.local/share/nvim/plugged')

" Nerdtree {{{2
Plug 'scrooloose/nerdtree'                " File tree view
" TODO here
Plug 'Xuyuanp/nerdtree-git-plugin'        " Plugin for git

" Autocomplete {{{2
" Make sure neovim has python3 support
" Check with this command :echo has("python3")
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto completion
Plug 'Shougo/neoinclude.vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-clang'

" Snippets {{{2
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Airline {{{2
Plug 'bling/vim-airline'                  " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'     " Themes for airline

" Git {{{2
Plug 'tpope/vim-fugitive'                 " Git
Plug 'tpope/vim-rhubarb'                  " Github plugin for fugitive
Plug 'airblade/vim-gitgutter'

" Neomake {{{2
Plug 'benekastah/neomake'                 " Async :make and linting framework
Plug 'benjie/neomake-local-eslint.vim'    " Prefer local repo install of eslint over global install
Plug 'marijnh/tern_for_vim'               " Javascript Tern support

" Javascript {{{2
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'

" Markdown {{{2
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'shime/vim-livedown'

" Latex {{{2
Plug 'lervag/vimtex'

" Misc {{{2
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'flazz/vim-colorschemes'             " For color schemes
Plug 'sheerun/vim-polyglot'               " A large collection of language packs, syntax, auto-indent, ftplugins
Plug 'junegunn/goyo.vim'                  " Distraction-free writing in Vimlet g:user_emmet_leader_key = '<C-y>'.
Plug 'jiangmiao/auto-pairs'               " Auto match brackets in insert mode
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'                 " A universal set of defaults that (hopefully) everyone can agree on.
Plug 'tpope/vim-eunuch'                   " Unix commands
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " It is like a fuzzy finder, but is more generic.
Plug 'gko/vim-coloresque'                 " Highlight colors in CSS

call plug#end()

" Configure plugins {{{1
" NERD Tree {{{2
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:NERDTreeQuitOnOpen = 1

" Denite {{{2
noremap <C-p> :Denite buffer file_rec<CR>
call denite#custom#option('default', 'prompt', '>')

call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-p>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" Emmet vim {{{2
let g:user_emmet_leader_key = '<M-y>'
imap ½ <plug>(emmet-expand-abbr)

" Neomake {{{2
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" JsDoc {{{2
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
"let g:jsdoc_input_description=1

" Airline  {{{2
let g:airline_theme='tomorrow'
"let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

nmap <M-0> <Plug>AirlineSelectPrevTab
nmap <M-+> <Plug>AirlineSelectNextTab

" Commentary {{{2
noremap <C-e> :Commentary<CR>

" Goyo {{{2
noremap <leader>g :Goyo<CR>

" Theme {{{2
"colorscheme slate      " Dark theme
colorscheme Tomorrow    " Light theme

" Use deoplete, for autocomplete {{{2
call deoplete#enable()

" Ignore words in the buffer
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer']
let g:deoplete#ignore_sources.javascript = ['buffer', 'tag']

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes to tern
let g:tern#filetypes = ['jsx', 'js']

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

" snippets expand{{{2
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

