#!/bin/sh

mic=(
  icon=􀊱
  icon.padding_right=8
  label.drawing=off
  update_freq=2
  script="$PLUGIN_DIR/mic.sh"
)

sketchybar --add item mic left \
           --set mic "${mic[@]}" \
           --subscribe mic mouse.clicked volume_change
