" Use deoplete, for autocomplete
call deoplete#enable()

let g:deoplete#sources = {}
let g:deoplete#ignore_sources = {}
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#functions = {}

set completeopt=longest,menuone,preview

let g:deoplete#ignore_sources._ = ['buffer', 'around']
call deoplete#custom#set('ultisnips', 'rank', 10)

" Deoplete javascript support {{{2

let g:deoplete#omni#functions.javascript = [
\ 'tern#Complete',
\ 'jspc#omni'
\]

let g:deoplete#sources['javascript.jsx'] = ['ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:deoplete#ignore_sources.javascript = ['buffer', 'tag']

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes to tern
let g:tern#filetypes = ['jsx', 'js']

" General tern settings
let g:tern_map_keys=1

" Deoplete python support {{{1
let g:deoplete#sources.python = ['jedi']

" let g:deoplete#omni_patterns.rust = '[(\.)(::)]'
" let g:deoplete#sources.rust = ['racer']

" Vimtex with deoplete {{{1

" From the documentation *vimtex-complete-deoplete*
let g:deoplete#omni#input_patterns.tex = '\\(?:'
    \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
    \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|\w*'
    \ .')'


" Deoplete Clang support {{{1
if has("macunix")
    let newestVersionPath = split(expand('/usr/local/Cellar/llvm/*'), '\n')[-1]
    let newestVersion = fnamemodify(newestVersionPath, ':tr')

    let g:deoplete#sources#clang#libclang_path="/usr/local/Cellar/llvm/". newestVersion ."/lib/libclang.dylib"
    let g:deoplete#sources#clang#clang_header="/usr/local/Cellar/llvm/". newestVersion ."/lib/clang/". newestVersion
elseif has("unix")
    if filereadable("/usr/lib/libclang.so")
        let g:deoplete#sources#clang#libclang_path="/usr/lib/libclang.so"
        let g:deoplete#sources#clang#clang_header="/usr/lib/clang/"
    else
        let g:deoplete#sources#clang#libclang_path="/usr/lib/llvm-4.0/lib/libclang.so.1"
        let g:deoplete#sources#clang#clang_header="/usr/lib/llvm-4.0/lib/clang/4.0.0"
    endif
endif


" SuperTab and snippets {{{1

" Move forward through tab completion
let g:SuperTabDefaultCompletionType = "<c-n>"

" General UltiSnips settings
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" The following code is originally by simonweil, and can be found here
" https://github.com/simonweil/dotfiles/blob/master/nvimrc#L29-L85

" Don't map any tabs, I'll do it later
let g:UltiSnipsExpandTrigger = '<NOP>'
let g:UltiSnipsJumpForwardTrigger = '<NOP>'
let g:UltiSnipsJumpBackwardTrigger = '<NOP>'
let g:SuperTabMappingForward = '<NOP>'
let g:SuperTabMappingBackward = '<NOP>'

xnoremap <tab> :call UltiSnips#SaveLastVisualSelection()<CR>gvs

" Ultisnips unmaps some keybindings while editing snippets, disable this for
" my funcions
let g:UltiSnipsMappingsToIgnore = [ "SmartTab", "SmartShiftTab" ]

" Make <CR> smart
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
" First try to expand a snippet
call UltiSnips#ExpandSnippet()
if g:ulti_expand_res
" if successful, just return
return ''
elseif pumvisible()
" if in completion menu - just close it and leave the cursor at the
" end of the completion
return deoplete#mappings#close_popup()
else
" otherwise, just do an "enter"
return "\<return>"
endif
endfunction
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

function! g:SmartTab()
if pumvisible()
return SuperTab("n")
else
call UltiSnips#JumpForwards()
if g:ulti_jump_forwards_res == 0
  " return SuperTab("n")
  return "\<tab>"
endif
return ''
endif
endfunction
inoremap <silent> <tab> <C-R>=g:SmartTab()<cr>
snoremap <silent> <tab> <Esc>:call g:SmartTab()<cr>

function! g:SmartShiftTab()
if pumvisible()
return SuperTab("p")
else
call UltiSnips#JumpBackwards()
if g:ulti_jump_backwards_res == 0
  return SuperTab("p")
endif
return ''
endif
endfunction
inoremap <silent> <s-tab> <C-R>=g:SmartShiftTab()<cr>
snoremap <silent> <s-tab> <Esc>:call g:SmartShiftTab()<cr>

