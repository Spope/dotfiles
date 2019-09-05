" Color in red next highligth (Mapping in mapping.vim)
"hi WhiteOnRed ctermfg=white ctermbg=darkred
"function! HLNext (blinktime)
    "let [bufnum, lnum, col, off] = getpos('.')
    "let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    "let target_pat = '\c\%#\%('.@/.'\)'
    "let ring = matchadd('WhiteOnRed', target_pat, 101)
    "redraw
    "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    "call matchdelete(ring)
    "redraw
"endfunction

" remove trailing white spaces before saving files (mapping in autocmd)
function! TrimWhiteSpace()
" Save cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//e

" Restore cursor position
  call cursor(l, c)
endfunction
