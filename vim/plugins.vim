" Import custom plugins config
for f in split(glob('~/dotfiles/vim/plugins/*.vim'), '\n')
    exe 'source' f
endfor
