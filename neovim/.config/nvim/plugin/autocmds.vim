" Functions can be found in 'autoload/autocmds.vim'

autocmd BufWrite * call autocmds#DeleteTrailingWS()
