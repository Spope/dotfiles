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

## Neovim (LazyVim) configuration

    ln -s ~/dotfiles/nvim ~/.config/nvim

Then in Neovim, run `:Lazy restore` to install the plugin versions pinned in `lazy-lock.json`.

## Omarchy configuration

Customizations on top of a stock [Omarchy](https://omarchy.org/) install, in `omarchy/`:

* `hypr/monitors.lua`: screen zoom (`GDK_SCALE` 1, monitor scale 1.15)
* `hypr/input.lua`: trackpad (sensitivity 0.25, adaptive acceleration, natural scroll, scroll factor 0.1) and Caps Lock as Ctrl (both Shifts toggle Caps Lock)
* `herdr/config.toml`: herdr without onboarding and toast notifications

On a fresh install, back up the Omarchy defaults and link these files in their place:

    for f in hypr/monitors.lua hypr/input.lua herdr/config.toml; do
        mv ~/.config/$f ~/.config/$f.omarchy-default
        ln -s ~/dotfiles/omarchy/$f ~/.config/$f
    done

Hyprland reloads automatically; check for errors with:

    hyprctl reload && hyprctl configerrors

Note: these are full copies of Omarchy's files. After an Omarchy update, compare them with
`/usr/share/omarchy/config/` to pick up new defaults.

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

    ln -s ~/dotfiles/.zshrc ~/.zshrc

Tools :

    ln -s ~/dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/.screenrc ~/.screenrc
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/.mongorc.js ~/.mongorc.js

Git identity is machine-specific and kept out of `.gitconfig`. Set it in the local git config:

    git config --file ~/.config/git/config user.name "Thomas Pinaud"
    git config --file ~/.config/git/config user.email "you@example.com"

To sign commits on a machine that has your GPG key, add there too:

    git config --file ~/.config/git/config user.signingkey <KEY_ID>
    git config --file ~/.config/git/config commit.gpgsign true

## Mucks configuration

    ln -s ~/dotfiles/tmuxConfigurations/mucks-command.sh /usr/local/bin/mucks-command
    chmod +x ~/dotfiles/tmuxConfigurations/mucks-command.sh

    ln -s ~/dotfiles/tmuxConfigurations/mucks-menu.sh /usr/local/bin/mucks
    chmod +x ~/dotfiles/tmuxConfigurations/mucks-menu.sh
