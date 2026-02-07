#!/bin/bash

if [ "$(tmux display-message -p -F '#{session_name}')" = "$1" ]; then
  tmux switch-client -l
else
  tmux switch-client -t "$1"
fi
