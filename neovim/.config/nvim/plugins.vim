" Check if plugged is installed and istall if not
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Setup plugged	------------------------------{{{1

call plug#begin('~/.local/share/nvim/plugged')

" Nerdtree {{{2
Plug 'scrooloose/nerdtree'                " File tree view
" TODO here
Plug 'Xuyuanp/nerdtree-git-plugin'        " Plugin for git

" Autocomplete {{{2
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

" Airline {{{2
Plug 'bling/vim-airline'                  " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'     " Themes for airline

" Git {{{2
Plug 'tpope/vim-fugitive'                 " Git
Plug 'tpope/vim-rhubarb'                  " Github plugin for fugitive
Plug 'airblade/vim-gitgutter'

" Search {{{2
Plug 'mileszs/ack.vim'
Plug 'wincent/command-t', {
\   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
\ }

" Neomake {{{2
Plug 'benekastah/neomake'                 " Async :make and linting framework
"Plug 'benjie/neomake-local-eslint.vim'    " Prefer local repo install of eslint over global install
Plug 'jaawerth/neomake-local-eslint-first'

" Javascript {{{2
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }

" Markdown {{{2
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }

"Multiple cursors  {{{2
let g:multi_cursor_next_key='<M-n>'

" Latex {{{2
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'donRaphaco/neotex', { 'for': 'tex', 'do': ':UpdateRemotePlugins' }

" tpope {{{2
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'                 " A universal set of defaults that (hopefully) everyone can agree on.
Plug 'tpope/vim-eunuch'                   " Unix commands
Plug 'tpope/vim-commentary'               " Comment stuff out
Plug 'tpope/tpope-vim-abolish'            " Easier search, abbreviation and coersion
Plug 'tpope/vim-repeat'                   " Plugin wise dot repeat

" Misc {{{2
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

" Configure plugins	------------------------------{{{1

" NERD Tree {{{2

let NERDTreeMinimalUI=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:NERDTreeQuitOnOpen = 1

" Emmet vim {{{2
let g:user_emmet_leader_key = '<M-y>'
imap ½ <plug>(emmet-expand-abbr)

" Git configurations {{{2
let g:gitgutter_map_keys = 0

" Neomake {{{2
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

noremap <Leader>no :lopen<CR>      " open location window
noremap <Leader>nc :lclose<CR>     " close location window
noremap <Leader>n, :ll<CR>         " go to current error/warning
noremap <Leader>nn :lnext<CR>      " next error/warning
noremap <Leader>np :lprev<CR>      " previous error/warning

let g:neomake_error_sign = {'text': '🗙', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
    \   'text': 'W',
    \   'texthl': 'NeomakeWarningSign',
    \ }
let g:neomake_message_sign = {
    \   'text': '➤',
    \   'texthl': 'NeomakeMessageSign',
    \ }
let g:neomake_info_sign = {'text': '•', 'texthl': 'NeomakeInfoSign'}

" JsDoc {{{2
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
"let g:jsdoc_input_description=1

" Airline  {{{2
let g:airline_theme='tomorrow'
"let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Devicons for airline
let g:airline_powerline_fonts = 1

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''

if has("gui_running")
nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab9

nmap <M-0> <Plug>AirlineSelectPrevTab
nmap <M-+> <Plug>AirlineSelectNextTab
else
nmap g1 <Plug>AirlineSelectTab1
nmap g2 <Plug>AirlineSelectTab2
nmap g3 <Plug>AirlineSelectTab3
nmap g4 <Plug>AirlineSelectTab4
nmap g5 <Plug>AirlineSelectTab5
nmap g6 <Plug>AirlineSelectTab6
nmap g7 <Plug>AirlineSelectTab7
nmap g8 <Plug>AirlineSelectTab8
nmap g9 <Plug>AirlineSelectTab9
endif

" Commentary {{{2
nmap <C-e> :Commentary<CR>
vmap <C-e> :Commentary<CR>

" Command-T {{{2
nmap <leader>tt <plug>(CommandT)
nmap <leader>tc <Plug>(CommandTCommand)
nmap <leader>th <Plug>(CommandTHelp)
nmap <leader>tl <Plug>(CommandTLine)
nmap <leader>ts <Plug>(CommandTSearch)
nmap <leader>tb <Plug>(CommandTBuffer)

" Latex ------------------------------ {{{2
" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_fold_enabled = 1

" neotex
let g:neotex_delay=3000

" Goyo {{{2
noremap <leader>g :Goyo<CR>

" Use deoplete, for autocomplete {{{2
call deoplete#enable()

let g:deoplete#sources = {}
let g:deoplete#ignore_sources = {}
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#functions = {}

set completeopt=longest,menuone,preview

let g:deoplete#ignore_sources._ = ['buffer', 'around']

" Deoplete javascript support {{{3

let g:deoplete#omni#functions.javascript = [
\ 'tern#Complete',
\ 'jspc#omni'
\]

let g:deoplete#sources['javascript.jsx'] = ['ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:deoplete#ignore_sources.javascript = ['buffer', 'tag']

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes to tern
let g:tern#filetypes = ['jsx', 'js']

" General tern settings
let g:tern_map_keys=1

" Deoplete python support {{{3
let g:deoplete#sources.python = ['jedi']

" Vimtex with deoplete {{{3

" From the documentation *vimtex-complete-deoplete*
let g:deoplete#omni#input_patterns.tex = '\\(?:'
    \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
    \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|\w*'
    \ .')'


" Deoplete Clang support {{{3
if has("unix")
let g:deoplete#sources#clang#libclang_path="/usr/lib/llvm-4.0/lib/libclang.so.1"
let g:deoplete#sources#clang#clang_header="/usr/lib/llvm-4.0/lib/clang/4.0.0"
else

endif

" SuperTab and snippets {{{3

" Move forward through tab completion
let g:SuperTabDefaultCompletionType = "<c-n>"

" General UltiSnips settings
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" The following code is originally by simonweil, and can be found here
" https://github.com/simonweil/dotfiles/blob/master/nvimrc#L29-L85

" Don't map any tabs, I'll do it later
let g:UltiSnipsExpandTrigger = '<NOP>'
let g:UltiSnipsJumpForwardTrigger = '<NOP>'
let g:UltiSnipsJumpBackwardTrigger = '<NOP>'
let g:SuperTabMappingForward = '<NOP>'
let g:SuperTabMappingBackward = '<NOP>'

xnoremap <tab> :call UltiSnips#SaveLastVisualSelection()<CR>gvs

" Ultisnips unmaps some keybindings while editing snippets, disable this for
" my funcions
let g:UltiSnipsMappingsToIgnore = [ "SmartTab", "SmartShiftTab" ]

" Make <CR> smart
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
" First try to expand a snippet
call UltiSnips#ExpandSnippet()
if g:ulti_expand_res
" if successful, just return
return ''
elseif pumvisible()
" if in completion menu - just close it and leave the cursor at the
" end of the completion
return deoplete#mappings#close_popup()
else
" otherwise, just do an "enter"
return "\<return>"
endif
endfunction
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

function! g:SmartTab()
if pumvisible()
return SuperTab("n")
else
call UltiSnips#JumpForwards()
if g:ulti_jump_forwards_res == 0
  " return SuperTab("n")
  return "\<tab>"
endif
return ''
endif
endfunction
inoremap <silent> <tab> <C-R>=g:SmartTab()<cr>
snoremap <silent> <tab> <Esc>:call g:SmartTab()<cr>

function! g:SmartShiftTab()
if pumvisible()
return SuperTab("p")
else
call UltiSnips#JumpBackwards()
if g:ulti_jump_backwards_res == 0
  return SuperTab("p")
endif
return ''
endif
endfunction
inoremap <silent> <s-tab> <C-R>=g:SmartShiftTab()<cr>
snoremap <silent> <s-tab> <Esc>:call g:SmartShiftTab()<cr>

