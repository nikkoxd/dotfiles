#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

update() {
  sketchybar --set "$NAME" icon.highlight="$SELECTED"

  if "$SELECTED"; then
    sketchybar --animate cos 15 --set "$NAME" background.y_offset=-15
  else
    sketchybar --animate cos 15 --set "$NAME" background.y_offset=-20
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
