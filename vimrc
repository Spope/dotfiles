" Cancek VI compatibility
set nocompatible

" Pathogen init; Must be on top of vimRC
call pathogen#infect()
silent! call pathogen#helptags()

""""""""""""""""""
" Display
""""""""""""""""""
set title             " Update window title
set number            " line number
set relativenumber    " show relative line numbers"
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
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
set autoread          " Set to auto read when a file is changed from the outside

autocmd BufNewFile,BufRead *.log set synmaxcol=200  "Stop color highlight on lines of 200+ characters (slow)

hi NonText ctermfg=7 guifg=gray " Non text chars color

syntax enable  " Syntax hightlight

" Specific behaviour for file (syntax, indent ...)
filetype on
filetype plugin on
filetype indent on

set autoread          " Reload file on external change

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


let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_php_checkers = ['php']

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


"HTML
" Bind ctrl + space for completion
:imap <C-Space> <C-X><C-O>
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"Open nerdtree on F2
"map <F2> :NERDTreeToggle<CR>
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['\.\.$', '\.$', '\~$', '\.swp$']

map <F2> :Lexplore<CR>
let g:netrw_liststyle = 3    " List style
let g:netrw_banner = 0       " Remove useless header
let g:netrw_browse_split = 4 " Open file in last window
let g:netrw_winsize = 25     " Width
let g:netrw_altv = 1

" Indent line carachter displayd
let g:indentLine_char = '|'

"php-doc : leader + h
nnoremap <leader>h :call PhpDocSingle()<CR> 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-I> :CtrlPBuffer<CR>

"Markdown syntax
let g:vim_markdown_folding_disabled = 1

"emmet          : ctrl + y ,
"WindowSwap.vim : leader + ww
