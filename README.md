# Installation

## Vim configuration

    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim/ ~/.vim

On Windows :
* Delete existing _vimrc and vimfiles
* Launch a cmd.exe **as an administrator**

<b></b>

    mklink "c:\Users\USERNAME\.vimrc" "C:\Users\USERNAME\dotfiles\vimrc"
    mklink /D "c:\Users\USERNAME\vimfiles" "C:\Users\USERNAME\dotfiles\vim"

## Sublime Text 3 configuration

On Linux:

    To be defined

On Windows:
* Delete folders
* Launch a cmd.exe **as an administrator**

<b></b>

    mklink /D "C:\Users\USERNAME\AppData\Roaming\Sublime Text 3\Installed Packages" "C:\Users\USERNAME\dotfiles\sublime-text-3\InstalledPackages"
    mklink /D "c:\Users\USERNAME\AppData\Roaming\Sublime Text 3\Packages" "c:\Users\USERNAME\dotfiles\sublime-text-3\Packages"

## Preferences

    ln -s ~/dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/dotfiles/.gitconfig ~/.gitconfig
