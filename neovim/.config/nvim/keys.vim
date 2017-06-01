" Change leader
let mapleader = ","

" Add mouse support
set mouse=a

" Resizing
"nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>j :exe "resize +10"<CR>
nnoremap <silent> <Leader>k :exe "resize -10"<CR>
nnoremap <silent> <Leader>h :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize -10"<CR>

" Tabs
nnoremap <silent> <Leader>1 1gt
nnoremap <silent> <Leader>2 2gt
nnoremap <silent> <Leader>3 3gt
nnoremap <silent> <Leader>4 4gt
nnoremap <silent> <Leader>5 5gt
nnoremap <silent> <Leader>6 6gt
nnoremap <silent> <Leader>7 7gt
nnoremap <silent> <Leader>8 8gt
nnoremap <silent> <Leader>9 :tablast<CR>

" Stop highlight after searching
nnoremap <silent> <leader><leader> :noh<cr>

" Terminal emulator mapping
:nnoremap <silent> <Leader>t :exe "terminal"<CR>
:tnoremap <Esc> <C-\><C-n>

" Neomake
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning
