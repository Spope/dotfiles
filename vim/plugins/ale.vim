" Linter
let g:ale_linters = {
\   'php': ['php'],
\   'javascript': ['jshint']
\}
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=1

let g:ale_virtualtext_cursor=0

command! Err :ALENext
command! Perr :ALEPrevious

"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
