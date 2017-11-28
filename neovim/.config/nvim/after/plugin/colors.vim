"colorscheme base16-tomorrow
colorscheme base16-tomorrow-night

" Custom colors specefic to Tomorrow-Night colorscheme
func! UpdateColorScheme()
    " Use dark background for terminals
    "hi MyTerminal guifg=#A1B0B8 guibg=#1F292E

    " A demonstration of what the line below this line does, when the text extends above the allowed length.

    " Only highlight text extending 80 columns
    " call matchadd('ColorColumn', '\%>81v.\+', 100)

    " Highlight everything extengind 80 columns
    let &l:colorcolumn='+' . join(range(0, 254), ',+')

    if g:colors_name == 'base16-tomorrow-night'
        hi CursorLineNR guifg=#FFB21C ctermfg=214
        "hi LineNr guifg=#969896
        "hi FoldColumn guifg=#007874
        hi Search guifg=#303030 guibg=#996500
    endif
endfunc

" Apply custom highlights when changing colorscheme
autocmd ColorScheme * call UpdateColorScheme()
autocmd BufRead * call UpdateColorScheme()
" Update colorschemes on launch
call UpdateColorScheme()

" Terminal color	------------------------------{{{1
" Have to be after colorscheme

func! ColorizeTerminal()
    set winhighlight=Normal:MyTerminal
    setlocal nocursorline
    setlocal nonumber
    setlocal norelativenumber
endfunction

autocmd TermOpen * call ColorizeTerminal()
