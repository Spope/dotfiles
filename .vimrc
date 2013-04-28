" Annule la compatibilité avec VI
set nocompatible

" Activation de pathogen. Doit rester en haut de .vimrc
call pathogen#infect()

" -- Affichage
set title             " Met à jour le titre de la fenetre
set number            " line number
set ruler             " Affiche la position du curseur
set wrap              " Affiche les lignes trop longues sur plusieurs ligne
set scrolloff=3       " Affiche un mini de 3 lignes autor du curseur

set encoding=utf-8
set hi=1000           " Historique des commandes
set guioptions-=m     "remove menu bar
set guioptions-=T     "remove toolbar
set guioptions-=r     "remove right-hand scroll bar
set guioptions-=L     "remove left-hand scroll bar
set list
set listchars=trail:⋅,nbsp:⋅
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

let molokai_original=1
colorscheme mustang
"colorscheme molokai
if has("win32") || has("win16")
    set guifont=Consolas:h10
else
    set guifont=Monospace
endif
" Monospace
" set background=dark
" colorscheme solarized

" Leader map for plugins
let mapleader=","

"Open nerdtree on F2
map <F2> :NERDTreeToggle<CR>

" CtrlP config
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|data\|logs\|cache\|vendor\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Indent line carachter displayd
let g:indentLine_char = '┆'

" Key binding
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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




"HTML
" Bind ctrl + space for completion
:imap <C-Space> <C-X><C-O>
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
