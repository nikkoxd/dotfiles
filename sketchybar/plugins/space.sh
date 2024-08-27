#!/bin/sh

update() {
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on
  else
    sketchybar --set "$NAME" background.drawing=off
  fi
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy "$SID"
    sketchybar --trigger aerospace_workspace_change
  else
    aerospace workspace "$1"
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked "$@"
  ;;
  *) update "$@"
  ;;
esac
