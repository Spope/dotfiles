" Cancek VI compatibility
set nocompatible
let mapleader="\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'qpkorr/vim-bufkill'
Plug 'itchyny/lightline.vim'
Plug 'croaker/mustang-vim'
Plug 'tyrannicaltoucan/vim-quantum'
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
Plug 'zxqfl/tabnine-vim'
Plug 'w0rp/ale'
Plug 'embear/vim-localvimrc'
Plug 'maximbaz/lightline-ale'
Plug 'mbbill/undotree'
Plug 'svermeulen/vim-yoink'
Plug 'eugen0329/vim-esearch'
"  Make sure you use single quotes
call plug#end()

source ~/dotfiles/vim/plugins.vim
source ~/dotfiles/vim/functions.vim
source ~/dotfiles/vim/mappings.vim

"===============================================================================
" Options:
"===============================================================================
syntax enable  " Syntax hightlight
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

" Specific behaviour for file (syntax, indent ...)
filetype on
filetype plugin on
filetype indent on

" Search
set ignorecase        " Ignore case on serach
set smartcase         " Search with case if case in search
set incsearch         " Higligth search during search
set hlsearch          " Higligth search

" Beep
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

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set splitright

" Fold
set foldmethod=indent
set foldlevel=1
hi Folded guibg=#262626 ctermbg=235

"===============================================================================
" Appearence:
"===============================================================================
hi NonText ctermfg=7 guifg=gray " Non text chars color
" colorscheme mustang
set background=dark
set termguicolors
let g:quantum_black=1
colorscheme quantum

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

" Show tab, nbsp and tailing spaces
exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list

" Colors in tmux
if exists('$TMUX')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"===============================================================================
" Autocommands:
"===============================================================================
"Stop color highlight on lines of 200+ characters (slow)
autocmd BufNewFile,BufRead *.log set synmaxcol=200

" remember last position in file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Files format
au BufNewFile,BufRead *.tpl :set ft=html " tpl are HTML
"TWIG coloration (use htmljinja a python template engine)
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.njk set filetype=htmljinja
au BufRead,BufNewFile *.scala set filetype=scala
au BufRead,BufNewFile *.json set ai filetype=javascript

"HTML
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Clean whitespace on save
autocmd BufWritePre * call TrimWhiteSpace()


"===============================================================================
" Allow overriding these settings:
"===============================================================================

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Allow vim conf per projects
if filereadable(".project.vim")
  source .project.vim
endif

if filereadable(".editor/project.vim")
  source .editor/project.vim
endif

"===============================================================================
" TIPS
"===============================================================================

" PHP class autocomplete ctrl-x ctrl-o  (ctrl-n / ctrl-p to navigate)
