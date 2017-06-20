" Change leader	------------------------------{{{1
let mapleader = ","
let maplocalleader = ",,"

" Resizing	------------------------------{{{1
" Jump between windows is mapped to <C-j/k/h/l>
nnoremap <silent> <C-w>j :exe "resize +10"<CR>
nnoremap <silent> <C-w>k :exe "resize -10"<CR>
nnoremap <silent> <C-w>h :exe "vertical resize +10"<CR>
nnoremap <silent> <C-w>l :exe "vertical resize -10"<CR>

" Navigation	------------------------------{{{1
noremap j gj
noremap k gk

nmap H ^
vmap H ^

nmap L g_
vmap L g_

nmap J 5j
vmap J 5j

nmap K 5k
vmap K 5k

autocmd FileType help nnoremap <buffer> <CR> <C-]>

nnoremap <M-Down> <C-e>
nnoremap <M-Up> <C-y>

" nnoremap <Down> 5<C-e>
" nnoremap <Up> 5<C-y>
nnoremap <M-j> 5<C-e>
nnoremap <M-k> 5<C-y>

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

nmap æ [
nmap ø ]
omap æ [
omap ø ]
xmap æ [
xmap ø ]

" Buffers {{{1
noremap <silent> <leader>bd :bd<CR>
noremap <silent> <leader>bn :bn<CR>
noremap <silent> <leader>bp :bp<CR>

" Editing	------------------------------{{{1
cnoremap %% <C-R>=fnameescape(expand('%:p:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Insert mode	------------------------------{{{1
" Delete line
inoremap <C-d> <esc>ddi

inoremap jj <esc>

" Clipboard	------------------------------{{{1
vnoremap <C-c> "+y
nnoremap <C-c> "+y<CR>

" Indentation	------------------------------{{{1
vmap < <gv
vmap > >gv
nmap < <<
nmap > >>

" Stop highlight after search	------------------------------{{{1
nnoremap <silent> <leader><leader> :noh<cr>

" Terminal emulator mappings	------------------------------{{{1
:nnoremap <silent> <M-t> :exe "terminal"<CR>
:tmap <C-w> <Esc><C-w>
:tnoremap <Esc> <C-\><C-n>

