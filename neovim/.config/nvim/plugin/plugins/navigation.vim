" NERDTree
let NERDTreeMinimalUI=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

noremap <C-n> :<C-r>=g:NERDTree.IsOpen() ? 'NERDTreeClose' : 'NERDTreeCWD'<CR><CR>

" let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:NERDTreeQuitOnOpen = 1

" Vinegar like with NERDTree
function! g:NERDTreeVinegar()
    let l:current=expand('%:t')
    " Check if NERDTree is open
    if l:current =~# '^NERD_tree_\d\+$'
        " Go up a directory
        call nerdtree#ui_glue#invokeKeyMap("U")

    else
        " Open Nerdtree where current file is located
        NERDTree %
        call search(l:current)
    endif
endfunc

noremap - :call g:NERDTreeVinegar()<CR>

