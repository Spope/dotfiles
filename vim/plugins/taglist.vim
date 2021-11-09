"vim taglist
""<NUL> = <C-Space>
map <NUL> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
" List only current buffer
let Tlist_Show_One_File = 1
" List only function, hide variable / class
let tlist_php_settings='php;f:function'

" for mac with brew ctags
" (https://galea.medium.com/getting-started-with-ctags-vim-on-macos-87bcb07cf6d)
let Tlist_Ctags_Cmd='`brew --prefix`/bin/ctags'
