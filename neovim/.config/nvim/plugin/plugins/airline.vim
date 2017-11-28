let g:airline_theme='tomorrow'
"let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Devicons for airline
let g:airline_powerline_fonts = 1

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''

if has("macunix")
    nmap ¡ <Plug>AirlineSelectTab1
    nmap “ <Plug>AirlineSelectTab2
    nmap § <Plug>AirlineSelectTab3
    nmap £ <Plug>AirlineSelectTab4
    nmap ∞ <Plug>AirlineSelectTab5
    nmap ™ <Plug>AirlineSelectTab6
    nmap ¶ <Plug>AirlineSelectTab7
    nmap [ <Plug>AirlineSelectTab8
    nmap ] <Plug>AirlineSelectTab9

    nmap ≠ <Plug>AirlineSelectPrevTab
    nmap ± <Plug>AirlineSelectNextTab
elseif has("gui_running")
    nmap <M-1> <Plug>AirlineSelectTab1
    nmap <M-2> <Plug>AirlineSelectTab2
    nmap <M-3> <Plug>AirlineSelectTab3
    nmap <M-4> <Plug>AirlineSelectTab4
    nmap <M-5> <Plug>AirlineSelectTab5
    nmap <M-6> <Plug>AirlineSelectTab6
    nmap <M-7> <Plug>AirlineSelectTab7
    nmap <M-8> <Plug>AirlineSelectTab8
    nmap <M-9> <Plug>AirlineSelectTab9

    nmap <M-0> <Plug>AirlineSelectPrevTab
    nmap <M-+> <Plug>AirlineSelectNextTab
else
    nmap g1 <Plug>AirlineSelectTab1
    nmap g2 <Plug>AirlineSelectTab2
    nmap g3 <Plug>AirlineSelectTab3
    nmap g4 <Plug>AirlineSelectTab4
    nmap g5 <Plug>AirlineSelectTab5
    nmap g6 <Plug>AirlineSelectTab6
    nmap g7 <Plug>AirlineSelectTab7
    nmap g8 <Plug>AirlineSelectTab8
    nmap g9 <Plug>AirlineSelectTab9
endif

