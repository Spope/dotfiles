# Get the Git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Custom bash prompt
#
# Includes custom character for the prompt, path, and Git branch name.
#
# Source: kirsle.net/wizards/ps1.html
OS=$(uname)
if [ "${OS}" != "Linux" ]; then
    export PS1="\n\[$(tput bold)\]\[$(tput setaf 5)\]➜ \[$(tput setaf 6)\]\w\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"

    export PATH=/opt/local/bin:/opt/local/sbin:${PATH}
else
    export PS1="\n\[$(tput bold)\]\[$(tput setaf 5)\]➜\[$(tput setaf 7)\] \w\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"
fi

alias ll='ls -al'

alias grep='grep --color=auto'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
