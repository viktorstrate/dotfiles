let g:CommandTAlwaysShowDotFiles = 1

let g:CommandTWildIgnore=&wildignore .
    \ ",*/.git/*,*/node_modules/*"

nmap <C-t> <plug>(CommandT)
nmap <leader>tc <Plug>(CommandTCommand)
nmap <leader>th <Plug>(CommandTHelp)
nmap <leader>tl <Plug>(CommandTLine)
nmap <leader>ts <Plug>(CommandTSearch)
nmap <leader>tb <Plug>(CommandTBuffer)