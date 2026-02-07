#!/bin/bash

front_app=(
  script="$HOME/.config/sketchybar/plugins/front_app.sh"
)

sketchybar --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
