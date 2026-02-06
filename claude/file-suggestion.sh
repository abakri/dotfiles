#!/bin/bash

cd $CLAUDE_PROJECT_DIR
query=$(cat | jq -r '.query')
rg --files --hidden --follow --no-ignore-vcs | fzf --filter "$query" | head -15
