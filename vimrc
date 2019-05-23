" Cancek VI compatibility
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'qpkorr/vim-bufkill'
Plug 'itchyny/lightline.vim'
Plug 'croaker/mustang-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'lunaru/vim-less'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'docteurklein/php-getter-setter.vim'
Plug 'alvan/vim-php-manual'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'shawncplus/phpcomplete.vim'
Plug 'zxqfl/tabnine-vim'
Plug 'w0rp/ale'
Plug 'embear/vim-localvimrc'
"  Make sure you use single quotes
call plug#end()

" Create .lvimrc into a project for local conf

""""""""""""""""""
" Display
""""""""""""""""""
set title             " Update window title
set number            " line number
"set relativenumber    " Relative line number
"augroup numbertoggle
  "autocmd!
  "autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  "autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END
set ruler             " Display cursor position
set wrap              " Wrap long line
set scrolloff=3       " Space aroun cursor on top / bottom

set t_Co=256          " 256 colors
set encoding=utf-8
set hi=1000           " Command history
set guioptions-=m     " remove menu bar
set guioptions-=T     " remove toolbar
set guioptions-=r     " remove right-hand scroll bar
set guioptions-=L     " remove left-hand scroll bar
set autoread          " Reload file on external change

autocmd BufNewFile,BufRead *.log set synmaxcol=200  "Stop color highlight on lines of 200+ characters (slow)

hi NonText ctermfg=7 guifg=gray " Non text chars color

syntax enable  " Syntax hightlight

" Specific behaviour for file (syntax, indent ...)
filetype on
filetype plugin on
filetype indent on

" -- Search
set ignorecase        " Ignore case on serach
set smartcase         " Search with case if case in search
set incsearch         " Higligth search during search
set hlsearch          " Higligth search

" -- Beep
set visualbell        " No beep
set noerrorbells      " No beep

"convert tab to space
set expandtab
set tabstop=4
set shiftwidth=4

" Backspace normal behaviour
set backspace=indent,eol,start

" Allow buffer switch witouht be prompted 'save file'
set hidden

set undofile " Maintain undo history between sessions"
set undodir=~/dotfiles/vim/undodir

colorscheme mustang

if has("win32") || has("win16")
    set guifont=Consolas:h10
else
    if system('uname')=~'Darwin'
        "OSX
        set guifont=Menlo:h13
    else
        "Linux
        set guifont=Monospace
    endif
endif

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendor|cache)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" Search tags wiht \
nnoremap \ :CtrlPTag<cr>
nnoremap <C-]> :vsp <CR>:exec("tag " . expand("<cword>"))<CR>
map <C-^> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Got to tag under cursor > ctrl+$ on mac os ctrl+] otherwise
" ctr+^ to open in new tab
set splitright

" Show tab, nbsp and tailing spaces
exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list


" Color in red next highligth
" nnoremap <silent> n   n:call HLNext(0.1)<cr>
" nnoremap <silent> N   N:call HLNext(0.1)<cr>
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

let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_php_checkers = ['php']
"let g:syntastic_php_phpcs_exec = '/usr/local/bin/phpcs'
"let g:syntastic_php_phpcs_args = '--standard=PSR2'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '!'

let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1

"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn

"let g:yntastic_debug = 3



" Files format
au BufNewFile,BufRead *.tpl :set ft=html " tpl are HTML
"TWIG coloration (use htmljinja a python template engine)
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.njk set filetype=htmljinja
au BufRead,BufNewFile *.scala set filetype=scala

"""""""""""""""""
" Key binding
"""""""""""""""""
" Leader map for plugins
let mapleader="\<Space>"

map <leader>lb :CtrlPBuffer <CR>

" Split naviguation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Indent re-selection
vnoremap < <gv
vnoremap > >gv

nnoremap <CR> :nohlsearch<cr>

" map 2 line break + cursor in middle;
imap <C-c> <CR><Esc>O

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Copy past to system clipboard
vmap <Leader>y "+y
vmap <Leader>p "+p
nmap <Leader>y "+y
nmap <Leader>p "+p

" switch between tab
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>

" I can type :help on my own, thanks.
noremap <F1> <Esc>
vnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Where do you think you are !
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop> imap <right> <nop>

"map <C-J> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

"Remove trailing space on save
autocmd BufWritePre * %s/\s\+$//e"

":w!! If not sudo, will ask password and save file
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"HTML
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"Open nerdtree on F2
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$', '\.swp$']

" Indent line carachter displayd
let g:indentLine_char = '│'
let g:indentLine_color_term = 238

"php-doc : leader + h
"Duplicate the template folder to modify it
let g:pdv_template_dir = $HOME ."/dotfiles/vim/plugged/pdv/templates"
nnoremap <leader>h :call pdv#DocumentCurrentLine()<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-I> :CtrlPBuffer<CR>

let g:lightline = {
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'syntastic', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag'
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ }
      \ }

if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


set foldmethod=indent
set foldlevel=1
hi Folded guibg=#262626 ctermbg=235

" Generate Getters Setters
map <leader>g <Plug>PhpgetsetInsertGetterSetter


"vim-php-manual
"Shift + k Open vim help
"Ctrl  + h Open php.net in browser
let g:php_manual_online_search_shortcut = '<c-d>'

" Insert php use statement <leader>u
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

let g:ale_linters = {
\   'php': ['php', 'phpstan'],
\}


" tabnine read only php file
let g:ycm_filetype_whitelist = { 'php': 1 }

" localvimrc don't ask and load .lvimrc file if found
let g:localvimrc_ask=0

" PHP class autocomplete ctrl-x ctrl-o  (ctrl-n / ctrl-p to navigate)
