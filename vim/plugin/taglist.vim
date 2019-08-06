"vim taglist
""<NUL> = <C-Space>
map <NUL> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
" List only current buffer
let Tlist_Show_One_File = 1
" List only function, hide variable / class
let tlist_php_settings='php;f:function'
