let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ctrl + v to paste into ctrlP search
let g:ctrlp_prompt_mappings = { 'PrtInsert("c")': ['<c-v>'] }

if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendor|cache)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Search tags wiht \
nnoremap \ :CtrlPTag<cr>

"nnoremap <C-I> :CtrlPBuffer<cr>
nnoremap <Tab> :CtrlPBuffer<cr>
