"colorscheme Tomorrow    " Light theme
colorscheme Tomorrow-Night " Dark theme
set background=dark

" Custom colors specefic to Tomorrow-Night colorscheme
hi CursorLineNR guifg=#FFB21C ctermfg=214
hi FoldColumn guifg=#007874
hi Search guifg=#303030 guibg=#996500

" Terminal color	------------------------------{{{1
" Have to be after colorscheme
" Use dark background for terminals
hi MyTerminal guifg=#A1B0B8 guibg=#1F292E

func! ColorizeTerminal()
    set winhighlight=Normal:MyTerminal
    setlocal nocursorline
    setlocal nonumber
    setlocal norelativenumber
endfunction

autocmd TermOpen * call ColorizeTerminal()
