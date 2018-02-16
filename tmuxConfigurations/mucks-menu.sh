#!/bin/bash
# Bash Menu Script For Mucks

# Heading
echo "MUCKS MENU";echo

# Menu
options=(`ls ~/dotfiles/tmuxConfigurations/*.mucksrc`)

PS3='Please enter your choice: '

select opt in "${options[@]}"
do
    mucks-command $opt; break
done
