" Change leader	------------------------------{{{1
let mapleader = ","
let maplocalleader = ","

" Navigation	------------------------------{{{1
noremap j gj
noremap k gk

nnoremap H ^
vnoremap H ^

nnoremap L g_
vnoremap L g_

nmap J 5j
vmap J 5j

nmap K 5k
vmap K 5k

" Insert mode navigation bindings
inoremap <M-Left> <Home>
inoremap <M-Right> <End>

" Show current file path
noremap <leader>p :echo expand('%:p')<CR>
" Show and copy current file path
" noremap <leader>pp :let @+=expand('%:p') \| let @"=expand('%:p') \| echo expand('%:p')<CR>

" Change to previous buffer
noremap <leader><leader> <C-^>

nnoremap <M-Down> <C-e>
nnoremap <M-Up> <C-y>

nnoremap <Down> 5<C-e>
nnoremap <Up> 5<C-y>

" To scroll
if (has('macunix'))
    nnoremap ‹ 5<C-e>
    nnoremap ∆ 5<C-y>
else
    nnoremap <M-j> 5<C-e>
    nnoremap <M-k> 5<C-y>
endif

" For danish keyboard layout, that doesn't have [ ]
nmap æ [
nmap ø ]
omap æ [
omap ø ]
xmap æ [
xmap ø ]

if (has('macunix'))
    nnoremap ä <M-[>
    nnoremap ö <M-]>
endif

" Buffers {{{1
noremap <silent> <leader>d :BD<CR>
noremap <silent> <leader>s :bn<CR>
noremap <silent> <leader>a :bp<CR>

noremap <silent> <leader>bd :bd<CR>
noremap <silent> <leader>bn :bn<CR>
noremap <silent> <leader>bp :bp<CR>
noremap <silent> <leader>bf :bf<CR>
noremap <silent> <leader>bl :bl<CR>
" Clear all buffers, except the current
" https://stackoverflow.com/a/42071865/4171526
noremap <silent> <leader>bc :%bd<CR>

noremap <leader>q :wq<CR>


" Editing	------------------------------{{{1
cnoremap %% <C-R>=fnameescape(expand('%:p:h')).'/'<cr>
map <leader>e :e %%

noremap <leader>w :w<CR>
noremap <leader>x :xit<CR>
noremap <localleader>s :source %<CR>

" Insert mode	------------------------------{{{1
" Delete line
inoremap <C-d> <esc>ddi

inoremap jj <esc>

" Command mode ------------------------------ {{{1
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Clipboard	------------------------------{{{1
vnoremap <C-c> "+y
nnoremap <C-c> "+y<CR>

" Indentation	------------------------------{{{1
vmap < <gv
vmap > >gv
nmap < <<
nmap > >>

" Stop highlight after search	------------------------------{{{1
nnoremap <silent> <ESC> :noh<cr>

" Terminal emulator mappings	------------------------------{{{1
if (has('macunix'))
    :nnoremap <silent> † :exe "terminal"<CR>
else
    :nnoremap <silent> <M-t> :exe "terminal"<CR>
endif

:tmap <C-w> <Esc><C-w>
:tnoremap <Esc> <C-\><C-n>

" Build related keybindings>----------------------------------{{{1
noremap <C-r> :make!<CR>
