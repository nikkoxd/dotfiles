#!/bin/bash

front_app=(
  popup.drawing=on
  popup.y_offset=-100
  script="$HOME/.config/sketchybar/plugins/front_app.sh"
)

sketchybar --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
