"===============================================================================
" Vim Mappings:
"===============================================================================

" Split naviguation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Indent re-selection
vnoremap < <gv
vnoremap > >gv

nnoremap <CR> :nohlsearch<cr>

" ctrl+C 2 line break + cursor in middle;
imap <C-c> <CR><Esc>O

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Copy past to system clipboard
vmap <Leader>y "+y
vmap <Leader>p "+p
nmap <Leader>y "+y
nmap <Leader>p "+p

" Switch between tab
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>

" Deactivate F1 help
noremap <F1> <Esc>
vnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Deactivate arrow
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>

":w!! If not sudo, will ask password and save file
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Go to tag under cursor > ctrl+$ on mac os ctrl+] otherwise
nnoremap <C-]> :vsp <CR>:exec("tag " . expand("<cword>"))<CR>

" ctr+^ to open in new tab
map <C-^> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Color in red next highligth (HLNext in function.vim)
" nnoremap <silent> n   n:call HLNext(0.1)<cr>
" nnoremap <silent> N   N:call HLNext(0.1)<cr>
