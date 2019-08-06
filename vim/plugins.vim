" common files for vim and neovim
for f in split(glob('~/dotfiles/vim/plugins/*.vim'), '\n')
    source f
endfor
