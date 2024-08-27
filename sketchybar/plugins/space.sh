#!/bin/sh

update() {
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on
  else
    sketchybar --set "$NAME" background.drawing=off
  fi
}

mouse_clicked() {
  aerospace workspace "$1"
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked "$@"
  ;;
  *) update "$@"
  ;;
esac
