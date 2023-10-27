#!/usr/bin/env bash

check_shell() {
    current_shell=$(echo SHELL)

    if [[ -f ~/.bash_profile ]]; then
      source ~/.bash_profile
    elif [[ -f ~/.bashrc ]]; then
      source ~/.bashrc
    elif [[ -f ~/.zprofile ]]; then
      source ~/.zprofile
    elif [[ -f ~/.zshrc ]]; then
      source ~/.zshrc
    fi
}

check_shell

nohup python3 /Users/$(whoami)/happy_halloween/yess_click.py > /Users/$(whoami)/happy_halloween/output.log 2>&1 &