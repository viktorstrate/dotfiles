let g:ale_fixers = {
            \   'javascript': [
            \       'eslint',
            \   ],
            \}

let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'

" highlight ALEErrorSign ctermfg=1 ctermbg=0 guibg=NONE guifg=#ff0000
"highlight ALEErrorSign ctermfg=0 ctermbg=0 guifg=#1d1f21 guibg=#cc6666
highlight! link ALEErrorSign DiffDelete

let g:ale_linters = { 'rust': [ 'rls', 'cargo', 'rustc' ] }
