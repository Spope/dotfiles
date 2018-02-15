# Get the Git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function jobs_count {
    cnt=$(jobs -l | wc -l)
    if [ $cnt -gt 0 ]; then
        echo -ne "\e[90m ${cnt}\e[m"
    fi
}
function jobs_count_osx {
    cnt=$(jobs -l | wc -l | tr -s " ")
    if [ $cnt -gt 0 ]; then
        echo -ne "$(tput setaf 255)${cnt}$(tput sgr0)"
    fi
}

# PS1 Style : http://misc.flogisoft.com/bash/tip_colors_and_formatting

# Custom bash prompt
#
# Includes custom character for the prompt, path, and Git branch name.
#
# Source: kirsle.net/wizards/ps1.html
OS=$(uname)
if [ "${OS}" != "Linux" ]; then
    export PS1="\[$(tput bold)\]\[$(tput setaf 6)\]➜ \w\[$(tput setaf 3)\]\$(parse_git_branch)\[$(tput sgr0)\]\`jobs_count_osx\` "

    export PATH=/opt/local/bin:/opt/local/sbin:${PATH}
else
    export PS1="\[$(tput bold)\]\[$(tput setaf 5)\]➜\[$(tput sgr0 ; tput setaf 7)\] \w\[$(tput bold ; tput setaf 3)\]\$(parse_git_branch)\[$(tput sgr0)\]\`jobs_count\` "
fi

alias ll='ls -al'

alias grep='grep --color=auto'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias tmux='tmux -2'

setxkbmap -option "nbsp:none"
setxkbmap -layout fr -option ctrl:nocaps #https://unix.stackexchange.com/questions/99085/save-setxkbmap-settings

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
