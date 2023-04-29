eval "$(/opt/homebrew/bin/brew shellenv)"

alias vim="nvim"
alias s="source ~/.zshrc"
alias c="clear"

function tmnew() {
    tmux new -s $1
}

function tmkill() {
    tmux kill-session -t $1
}

function tmattach() {
    tmux attach -t $1
}

