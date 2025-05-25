#!/bin/bash

if [ "$(tmux display-message -p -F '#{session_name}')" = "wallpapers" ]; then
  tmux switch-client -l
else
  tmux switch-client -t wallpapers
fi
