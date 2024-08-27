#!/bin/bash

update() {
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on
  else
    sketchybar --set "$NAME" background.drawing=off
  fi

  for sid in $(aerospace list-workspaces --monitor all --empty); do
    sketchybar --set "space.$sid" label.drawing=off
  done

  for sid in $(aerospace list-workspaces --monitor focused --empty no); do
    sketchybar --set "space.$sid" label.drawing=on
  done
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
