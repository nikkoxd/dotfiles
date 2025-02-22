#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

update() {
  sketchybar --set "$NAME" icon.highlight="$SELECTED"

  if "$SELECTED"; then
    sketchybar --animate sin 15 --set "$NAME" icon.width=40 icon.padding_left=16 icon.padding_right=16 background.color="$primary"
  else
    sketchybar --animate sin 15 --set "$NAME" icon.width=30 icon.padding_left=11 icon.padding_right=11 background.color="$surface_container"
  fi
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy "$SID"
    sketchybar --trigger space_change --trigger windows_on_spaces
  else
    yabai -m space --focus "$SID" 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
