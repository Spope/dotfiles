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

    ln -s ~/dotfiles/sublime-text-3/InstalledPackages/ ~/.config/sublime-text-3/Installed\ Packages
    ln -s ~/dotfiles/sublime-text-3/Packages/ ~/.config/sublime-text-3/Packages

On Windows:
* Delete folders
* Launch a cmd.exe **as an administrator**

<b></b>

    mklink /D "C:\Users\USERNAME\AppData\Roaming\Sublime Text 3\Installed Packages" "C:\Users\USERNAME\dotfiles\sublime-text-3\InstalledPackages"
    mklink /D "c:\Users\USERNAME\AppData\Roaming\Sublime Text 3\Packages" "c:\Users\USERNAME\dotfiles\sublime-text-3\Packages"

## Preferences

Bash :
On the existing .bashrc, add

    if [ -f ~/dotfiles/.bash_profile ]; then
        source ~/dotfiles/.bash_profile
    fi

Zsh :

    ln -s ~/dotfiles/.zprofile ~/.zprofile

Tools :

    ln -s ~/dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/.screenrc ~/.screenrc
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/.mongorc.js ~/.mongorc.js

## Mucks configuration

    ln -s ~/dotfiles/tmuxConfigurations/mucks-command.sh /usr/local/bin/mucks-command
    chmod +x ~/dotfiles/tmuxConfigurations/mucks-command.sh

    ln -s ~/dotfiles/tmuxConfigurations/mucks-menu.sh /usr/local/bin/mucks
    chmod +x ~/dotfiles/tmuxConfigurations/mucks-menu.sh
