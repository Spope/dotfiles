# Installation

## Vim configuration

    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim/ ~/.vim

On Windows :
* Delete existing _vimrc and vimfiles
* Launch a cmd.exe as an administrator

    mklink "c:\Users\USERNAME\.vimrc" "C:\Users\USERNAME\dotefiles\vimrc"
    mklink /D "c:\Users\USERNAME\vimfiles" "C:\Users\USERNAME\dotefiles\vim"

## Sublime Text 2 configuration

    ln -s ~/dotfiles/sublime-text-2/ ~/.config/sublime-text-2
