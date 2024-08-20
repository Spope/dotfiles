#if [ -f ~/dotfiles/.bash_profile ]; then
    #source ~/dotfiles/.bash_profile
#fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Load version control information
autoload -Uz vcs_info

# # Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f '
precmd() { vcs_info }

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# %F{cyan} open color
# %f       close color
#  arrow        %d = path
# ${vcs_info_msg_0_} show git branch
# (1j.(%j).) job count (ternary condition, displayed only if one or more
export PROMPT='%F{cyan}➜ %d%f ${vcs_info_msg_0_}%F{8}%(1j.(%j) .)%f'

alias ll='ls -al --color=auto'

alias grep='grep --color=auto'

alias tmux='tmux -2'
alias vim='/opt/homebrew/bin/vim'
alias ctags='/opt/homebrew/bin/ctags'

alias weather='curl wttr.in/Bordeaux'

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit


ctags=/opt/homebrew/bin/ctags
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
