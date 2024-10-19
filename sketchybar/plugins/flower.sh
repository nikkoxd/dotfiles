#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/colors-my.sh"

ITEMS_TO_HIDE=("front_app" "weather" "mic")
DRAWING=$(sketchybar --query "${ITEMS_TO_HIDE[0]}" | jq -r '.geometry.drawing')

if [ "$DRAWING" == "on" ]; then
  for i in "${!ITEMS_TO_HIDE[@]}"; do
    sketchybar --set "${ITEMS_TO_HIDE[i]}" drawing=off
  done
  sketchybar --set "$NAME" icon.color="$background" background.color="$primary"
  sketchybar --set "/menu\..*/" drawing=on
else
  sketchybar --set "$NAME" icon.color="$primary" background.color="$containerBackground"
  sketchybar --set "/menu\..*/" drawing=off
  for i in "${!ITEMS_TO_HIDE[@]}"; do
    sketchybar --set "${ITEMS_TO_HIDE[i]}" drawing=on
  done
fi
