#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

ITEMS_TO_HIDE=("front_app" "weather" "mic")
DRAWING=$(sketchybar --query "${ITEMS_TO_HIDE[0]}" | jq -r '.geometry.drawing')

if [ "$DRAWING" == "on" ]; then
  for i in "${!ITEMS_TO_HIDE[@]}"; do
    sketchybar --set "${ITEMS_TO_HIDE[i]}" drawing=off
  done
  sketchybar --set "$NAME" icon.color="$BACKGROUND" background.color="$ACCENT"
  sketchybar --set "/menu\..*/" drawing=on
else
  sketchybar --set "$NAME" icon.color="$ACCENT" background.color="$TRANSPARENT"
  sketchybar --set "/menu\..*/" drawing=off
  for i in "${!ITEMS_TO_HIDE[@]}"; do
    sketchybar --set "${ITEMS_TO_HIDE[i]}" drawing=on
  done
fi
