#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"

# variables
export GIT_EDITOR=nvim

alias vim="nvim"
alias s="source ~/.zshrc"
alias c="clear"
alias lg="lazygit"
alias hg="history | grep"
alias ls="echo -------------------------------- && pwd && echo -------------------------------- && ls -G -a -1"

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
