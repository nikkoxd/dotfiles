#!/bin/bash

spoofdpi=(
  icon.padding_left=10
  icon.padding_right=10
  label.drawing=off
  click_script="$PLUGIN_DIR/spoofdpi.sh"
)

sketchybar --add item spoofdpi right \
           --set spoofdpi "${spoofdpi[@]}"

if launchctl list | grep -qi spoof-dpi; then
  sketchybar --set spoofdpi icon=􀎤 icon.color="$ACCENT"
else
  sketchybar --set spoofdpi icon=􀎠 icon.color="$DISABLED"
fi
