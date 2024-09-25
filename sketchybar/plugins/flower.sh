#!/bin/bash

ITEMS_TO_HIDE=("front_app" "weather" "mic")
DRAWING=$(sketchybar --query "${ITEMS_TO_HIDE[0]}" | jq -r '.geometry.drawing')

if [ "$DRAWING" == "on" ]; then
  for i in "${!ITEMS_TO_HIDE[@]}"; do
    sketchybar --set "${ITEMS_TO_HIDE[i]}" drawing=off
  done
  sketchybar --set "/menu\..*/" drawing=on
else
  sketchybar --set "/menu\..*/" drawing=off
  for i in "${!ITEMS_TO_HIDE[@]}"; do
    sketchybar --set "${ITEMS_TO_HIDE[i]}" drawing=on
  done
fi
