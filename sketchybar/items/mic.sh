#!/bin/bash

mic=(
  icon=􀊱
  icon.padding_right=15
  label.drawing=off
  click_script="$PLUGIN_DIR/mic.sh"
)

sketchybar --add item mic left \
           --set mic "${mic[@]}"
