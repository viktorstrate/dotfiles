source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/plugins.vim

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
