" Change leader
let mapleader = ","

" Resizing
"nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>j :exe "resize +10"<CR>
nnoremap <silent> <Leader>k :exe "resize -10"<CR>
nnoremap <silent> <Leader>h :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize -10"<CR>

" Stop highlight after searching
nnoremap <silent> <leader>, :noh<cr>

" Neomake
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning
