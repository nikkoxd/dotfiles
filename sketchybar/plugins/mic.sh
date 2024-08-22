#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  osascript -e 'set volume input volume 100'
  sketchybar --set "$NAME" icon="􀊳" icon.color=$DISABLED
elif [[ $MIC_VOLUME -gt 0 ]]; then
  osascript -e 'set volume input volume 0'
  sketchybar --set "$NAME" icon="􀊱" icon.color=$ACCENT
fi
