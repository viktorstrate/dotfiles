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
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'zchee/deoplete-clang'

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

" Neomake {{{2
Plug 'benekastah/neomake'                 " Async :make and linting framework
Plug 'benjie/neomake-local-eslint.vim'    " Prefer local repo install of eslint over global install

" Javascript {{{2
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }

" Markdown {{{2
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'shime/vim-livedown'

" Latex {{{2
Plug 'lervag/vimtex'

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
Plug 'flazz/vim-colorschemes'             " For color schemes
Plug 'sheerun/vim-polyglot'               " A large collection of language packs, syntax, auto-indent, ftplugins
Plug 'junegunn/goyo.vim'                  " Distraction-free writing in Vimlet g:user_emmet_leader_key = '<C-y>'.
Plug 'jiangmiao/auto-pairs'               " Auto match brackets in insert mode
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " It is like a fuzzy finder, but is more generic.
Plug 'gko/vim-coloresque'                 " Highlight colors in CSS
Plug 'nelstrom/vim-visual-star-search'
Plug 'ryanoasis/vim-devicons'             " Icons, requires patched font https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts

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
noremap <C-e> :Commentary<CR>

" Goyo {{{2
noremap <leader>g :Goyo<CR>


" Use deoplete, for autocomplete {{{2
call deoplete#enable()

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Ignore words in the buffer
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer']
let g:deoplete#ignore_sources.javascript = ['buffer', 'tag']

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes to tern
let g:tern#filetypes = ['jsx', 'js']

" General tern settings
let g:tern_map_keys=1

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
let g:UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"

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


" Neomake	------------------------------{{{2
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning
