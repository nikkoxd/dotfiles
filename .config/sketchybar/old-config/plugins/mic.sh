#!/bin/bash

source "$HOME/.config/sketchybar/colors-my.sh"

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  osascript -e 'set volume input volume 100'
  sketchybar --set "$NAME" icon="􀊱" icon.color="$primary" background.color="$containerBackground"
elif [[ $MIC_VOLUME -gt 0 ]]; then
  osascript -e 'set volume input volume 0'
  sketchybar --set "$NAME" icon="􀊳" icon.color="$background" background.color="$primary"
fi
