" Change leader {{{1
let mapleader = ","

" Resizing {{{1
"nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>j :exe "resize +10"<CR>
nnoremap <silent> <Leader>k :exe "resize -10"<CR>
nnoremap <silent> <Leader>h :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize -10"<CR>

" Navigation {{{1
noremap j gj
noremap k gk

nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_
nnoremap J 5j
nnoremap K 5k

autocmd FileType Help nnoremap <buffer> <CR> <C-]>

nnoremap <M-Down> <C-e>
nnoremap <M-Up> <C-y>

nnoremap <C-Down> 5<C-e>
nnoremap <C-Up> 5<C-y>
nnoremap <M-j> 5<C-e>
nnoremap <M-k> 5<C-y>

" Editing {{{1
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Insert mode {{{1
" Delete line
inoremap <C-d> <esc>ddi

" Copy/paste to clipboard {{{1
vnoremap <C-c> "+y
nnoremap <C-c> "+y<CR>

" Indentation {{{1
vmap <S-Tab> <gv
vmap <Tab> >gv
nmap < <<
nmap > >>

" Stop highlight after searching {{{1
nnoremap <silent> <leader><leader> :noh<cr>

" Terminal emulator mapping {{{1
:nnoremap <silent> <Leader>t :exe "terminal"<CR>
:tmap <C-w> <Esc><C-w>
:tnoremap <Esc> <C-\><C-n>

" Neomake {{{1
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

