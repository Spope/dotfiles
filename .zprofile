#if [ -f ~/dotfiles/.bash_profile ]; then
    #source ~/dotfiles/.bash_profile
#fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# # Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# %F{cyan} open color
# %f       close color
#  arrow        %d = path
# ${vcs_info_msg_0_} show git branch
# (1j.(%j).) job count (ternary condition, displayed only if one or more
PROMPT="%F{cyan}➜ %d%f ${vcs_info_msg_0_} %F{8}%(1j.(%j) .)%f"

alias ll='ls -al --color=auto'

alias grep='grep --color=auto'

alias tmux='tmux -2'

alias weather='curl wttr.in/Bordeaux'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
