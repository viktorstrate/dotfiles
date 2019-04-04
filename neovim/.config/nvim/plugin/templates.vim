
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.h 0r $HOME/.config/nvim/templates/skeleton.h
        autocmd BufNewFile *.html 0r $HOME/.config/nvim/templates/skeleton.html
    augroup END
endif
