#!/bin/bash
eval "$(/opt/homebrew/bin/brew shellenv)"

# plugin stuff
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#https://lineleap.atlassian.net/browse/PAY-64 binds

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# path
export PATH=$PATH:/Users/aslan/.spicetify

alias vim="nvim"
alias s="source ~/.zshrc"
alias erc="nvim ~/.zshrc"
alias c="clear"
alias lg="lazygit"
alias hg="history | grep"
alias l="echo -e '\033[1m$(pwd)\033[0m\n' && ls -G -a -1 && echo"
alias f="fzf"

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
export GIT_EDITOR="nvim"
alias currbranch="git rev-parse --abbrev-ref HEAD"
alias diffremote="git diff origin/$(currbranch)"

function init_git_config() {
    git config --global sequence.editor interactive-rebase-tool
}

function diffpatch() {
    if [ $# -eq 0 ]; then
        echo "No diff branch specified"
        return
    fi
    local uuid=$(uuidgen)
    git diff $1 > ~/gitpatches/$uuid.patch
    echo "to patch, run:\n 'git apply ~/gitpatches/$uuid.patch'"
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# reveal alias meaning
local cmd_alias=""

# Reveal Executed Alias
alias_for() {
  [[ $1 =~ '[[:punct:]]' ]] && return
  local search=${1}
  local found="$( alias $search )"
  if [[ -n $found ]]; then
    found=${found//\\//} # Replace backslash with slash
    found=${found%\'} # Remove end single quote
    found=${found#"$search="} # Remove alias name
    found=${found#"'"} # Remove first single quote
    echo "${found} ${2}" | xargs # Return found value (with parameters)
  else
    echo ""
  fi
}

expand_command_line() {
  first=$(echo "$1" | awk '{print $1;}')
  rest=$(echo ${${1}/"${first}"/})

  if [[ -n "${first//-//}" ]]; then # is not hypen
    cmd_alias="$(alias_for "${first}" "${rest:1}")" # Check if there's an alias for the command
    if [[ -n $cmd_alias ]] && [[ "${cmd_alias:0:1}" != "." ]]; then # If there was and not start with dot
      echo "${T_GREEN}❯ ${T_YELLOW}${cmd_alias}${F_RESET}" # Print it
    fi
  fi
}

pre_validation() {
  [[ $# -eq 0 ]] && return                    # If there's no input, return. Else...
  expand_command_line "$@"
}

autoload -U add-zsh-hook                      # Load the zsh hook module. 
add-zsh-hook preexec pre_validation           # Adds the hook

# call local script if exists
test -f ~/local.sh && source ~/local.sh && echo "local.sh sourced!"
