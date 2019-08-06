" Linter
let g:ale_linters = {
\   'php': ['php'],
\}
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_enter=1

command! Err :ALENext
command! Perr :ALEPrevious

"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
