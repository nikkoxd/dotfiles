#!/bin/bash

front_app=(
    label.drawing=off
    icon.align=center
    script="$HOME/.config/sketchybar/plugins/front_app.sh"
)

sketchybar --add item front_app left \
    --set front_app "${front_app[@]}" \
    --subscribe front_app front_app_switched
