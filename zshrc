#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"

# plugin stuff
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#https://lineleap.atlassian.net/browse/PAY-64 binds

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# variables
export GIT_EDITOR=nvim

# path
export PATH=$PATH:/Users/aslan/.spicetify

alias vim="nvim"
alias s="source ~/.zshrc"
alias erc="nvim ~/.zshrc"
alias c="clear"
alias lg="lazygit"
alias hg="history | grep"
alias ls="echo -e '\033[1m$(pwd)\033[0m\n' && ls -G -a -1 && echo"

function tmnew() {
    tmux new -s $1
}

function tmkill() {
    tmux kill-session -t $1
}

function tmattach() {
    tmux attach -t $1
}

# appearance
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}


# git
alias currbranch="git rev-parse --abbrev-ref HEAD"
alias diffremote="git diff origin/$(currbranch)"

function init_git_config() {
    git config --global sequence.editor interactive-rebase-tool
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# call local script if exists
test -f ~/local.sh && source ~/local.sh && echo "local.sh sourced!"
