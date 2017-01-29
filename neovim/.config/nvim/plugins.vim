" Setup vim-plug
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" ### Plugins used on both vanilla vim and neovim
Plug 'scrooloose/nerdtree'                " File tree view
" Make sure neovim has python3 support
" Check with this command :echo has("python3")
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto completion
Plug 'bling/vim-airline'                  " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'tpope/vim-fugitive'                 " Git
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'                     " Path fyzzy file, buffer, mru, tag... finder
Plug 'flazz/vim-colorschemes'             " For color schemes

Plug 'benekastah/neomake'                 " Async :make and linting framework
Plug 'benjie/neomake-local-eslint.vim'    " Prefer local repo install of eslint over global install

" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

" Configure plugins
" NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

" Emmet vim
let g:user_emmet_leader_key='<leader><leader>'

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['flow', 'eslint']

" Airline
set laststatus=2

" Theme
colorscheme slate

" ## Neovim plugin configurations
" Use deoplete, for autocomplete
call deoplete#enable()
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
