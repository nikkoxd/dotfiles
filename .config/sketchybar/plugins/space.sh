#!/bin/sh

update() {
  sketchybar --set "$NAME" icon.highlight="$SELECTED" background.drawing="$SELECTED"

  if "$SELECTED"; then
    sketchybar --animate sin 15 --set "$NAME" width=40 
  else
    sketchybar --animate sin 15 --set "$NAME" width=30
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
