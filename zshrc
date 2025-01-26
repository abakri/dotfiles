#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"


# Load Antigen for plugins
source "$HOME/antigen.zsh"
antigen init ~/.antigenrc

# Zoxide init
eval "$(zoxide init zsh)"

# PATH
export PATH=$PATH:$HOME/.spicetify
export PATH="$PATH:$HOME/Library/Python/3.9/bin"
export PATH="$HOME/.local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# LANGUAGE SPECIFIC
# - Python -
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/ 
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=true

# ALIAS
alias vim="nvim"
alias s="source ~/.zshrc"
alias erc="nvim ~/.zshrc"
alias elocal="nvim ~/local.sh"
alias c="clear"
alias lg="lazygit"
alias hg="history | grep"
alias l="echo -e '\033[1m$(pwd)\033[0m\n' && ls -G -a -1 && echo"
alias f="fzf"

# Language specific aliases
alias pptnocap="pytest --no-cov --tb=long -vv --show-capture=stdout"

# copy fzf selection to clipboard
function cpf(){
    local selection=$(fzf)
    echo "copying $selection"
    echo -n $selection | pbcopy
}

# tmux-fzf session switch
function tms(){ 
    tmux switch -t $(tmux ls -F "#{session_name}" | fzf)
}

# git-fzf branch switch
function gbs(){ 
    git checkout $(git branch | fzf)
}

# git-fzf branch delete
function gbd(){ 
    git branch -D $(git branch | fzf -m)
}

# pytest use ripgrep to find function and pipe to fzf to choose which test to run
function pt(){
    if [ $# -eq 0 ]; then
        echo "No function specified"
        return
    fi
    local regex=".*def (?P<func>.*$1.*)\(.*$"
    local rgstring=$(rg $regex --replace ':$1' --glob='*test*.py')
    local pytest_path=$(echo $rgstring | fzf --delimiter='::' --with-nth=2)
    echo "Running test: $pytest_path"
    shift
    pytest --no-cov --tb=long -vv --show-capture=stdout $pytest_path "$@"
}

# copy uuid
function cpuuid(){
    local uuid=`echo "$(uuidgen)" | tr '[:upper:]' '[:lower:]'`
    echo "copying $uuid"
    echo -n $uuid | pbcopy
}

# scratch
function scratch(){
    if [ $# -eq 0 ]; then
        echo "No filetype specified"
        return
    fi
    local uuid=$(uuidgen)
    nvim $HOME/scratch/$uuid.$1
}

function tmnew() {
    tmux new -s $1
}

function tmkill() {
    tmux kill-session -t $1
}

function tmattach() {
    tmux attach -t $1
}

function tmbalance() {
    tmux select-layout even-horizontal
}

# appearance
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# git
export GPG_TTY=$(tty)
export GIT_EDITOR="nvim"
alias currbranch="git rev-parse --abbrev-ref HEAD"
alias cpbranch="echo -n $(currbranch) | pbcopy"
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
    # make folder if not exists
    mkdir -p ~/gitpatches
    git diff $1 > ~/gitpatches/$uuid.patch
    echo "to patch, run:\n 'git apply ~/gitpatches/$uuid.patch'"
}

# REVEAL ALIAS ----------------------------------------------------------------------------
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

# ----------------------------------------------------------------------------------------

# call local script if exists
test -f ~/local.sh && source ~/local.sh && echo "local.sh sourced!"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias pz='/Users/aslanbakri/workspace/devenv/devtools/pz'
_pz_autocomplete() {
    COMP_LINE="${BUFFER}"
    COMP_POINT=$CURSOR
    reply=($(COMP_LINE="$COMP_LINE" COMP_POINT="$COMP_POINT" pz))
}
compctl -K _pz_autocomplete pz
