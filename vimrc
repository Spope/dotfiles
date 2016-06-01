" Annule la compatibilité avec VI
set nocompatible

" Activation de pathogen. Doit rester en haut de .vimrc
call pathogen#infect()
silent! call pathogen#helptags()

""""""""""""""""""
" Affichage
""""""""""""""""""
set title             " Met à jour le titre de la fenetre
set number            " line number
set ruler             " Affice la position du curseur
" set colorcolumn=80    " Affiche la regle a 80 characteres
" highlight ColorColumn guibg=Black
set wrap              " Affiche les lignes trop longues sur plusieurs ligne
set scrolloff=3       " Affiche un mini de 3 lignes autor du curseur

set t_Co=256          " 256 colors
set encoding=utf-8
set hi=1000           " Historique des commandes
set guioptions-=m     "remove menu bar
set guioptions-=T     "remove toolbar
set guioptions-=r     "remove right-hand scroll bar
set guioptions-=L     "remove left-hand scroll bar
set autoread          "Set to auto read when a file is changed from the outside

set synmaxcol=200     "Stop color highlight on lines of 200+ characters (slow)

" Non text chars color
hi NonText ctermfg=7 guifg=gray

" Active la coloration syntaxique
syntax enable
" Active les comportements specifiques aux types de fichiers comme
" la syntaxe et l'indentation
filetype on
filetype plugin on
filetype indent on

set autoread          " Recharge le fichier lorsqu'il a été changé à l'exterieur
" set autoindent        " Autoindent on line break

" -- Recherche
set ignorecase        " Ignore la casse lors d'une recherche
set smartcase         " Active la casse si la recherche en contient une
set incsearch         " Surligne les résultats de recherche pendant la saisie
set hlsearch          " Surligne les résultats de recherche

" -- Beep
set visualbell        " Empeche Vim de beeper
set noerrorbells      " Empeche Vim de bepper

"convert tab to space
set expandtab
set tabstop=4
set shiftwidth=4

" Active le comportement 'normal' de la touche backspace
set backspace=indent,eol,start

" Cache les fichiers lors de l'ouverture d'autre fichiers
set hidden

"colorscheme base16-ocean
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

" Leader map for plugins
let mapleader="\<Space>"

"Open nerdtree on F2
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.\.$', '\.$', '\~$', '\.swp$']

" Indent line carachter displayd
let g:indentLine_char = '|'

"php-doc : leader+h
nnoremap <leader>h :call PhpDocSingle()<CR> 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-I> :CtrlPBuffer<CR>

"CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendor|cache)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_php_checkers = ['php']

"""""""""""""""""
" Key binding
"""""""""""""""""
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
imap <left> <nop>
imap <right> <nop>

" Files format
au BufNewFile,BufRead *.tpl :set ft=html " tpl are HTML
"TWIG coloration (use htmljinja a python template engine)
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.scala set filetype=scala


"HTML
" Bind ctrl + space for completion
:imap <C-Space> <C-X><C-O>
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
