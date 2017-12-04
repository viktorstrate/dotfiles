autocmd FileType javascript setlocal tabstop=2 softtabstop=2
autocmd FileType javascript setlocal foldmethod=indent foldlevel=1

autocmd FileType javascript nmap gd :TernDef<cr>
autocmd FileType javascript nmap gs :TernDefSplit<cr>
autocmd FileType javascript nmap gh :TernDoc<cr>
