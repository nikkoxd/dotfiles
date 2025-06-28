#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

update() {
  sketchybar --set "$NAME" icon.highlight="$SELECTED"

  if "$SELECTED"; then
    sketchybar --animate sin 15 --set "$NAME" icon.width=50 icon.width=40 background.color="0xffcccccc"
  else
    sketchybar --animate sin 15 --set "$NAME" icon.width=31 background.color="0x00000000"
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
