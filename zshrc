#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"

# plugin stuff
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# binds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# variables
export GIT_EDITOR=nvim

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

# call local script if exists
test -f ~/local.sh && source ~/local.sh && echo "local.sh sourced!"
