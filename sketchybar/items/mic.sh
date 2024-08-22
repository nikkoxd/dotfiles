#!/bin/sh

mic=(
  padding_right=10
  icon=􀊱
  icon.padding_right=10
  label.drawing=off
  script="$PLUGIN_DIR/mic.sh"
)

sketchybar --add item mic left \
           --set mic "${mic[@]}" \
           --subscribe mic mouse.clicked
