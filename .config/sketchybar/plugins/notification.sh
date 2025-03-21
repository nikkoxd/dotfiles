#!/bin/bash

[ "$SENDER" != "notification_triggered" ] && exit

LABEL="Notification"
ICON="􀋚"

yabaiWindowTypeChanged() {
  isFloating=$(yabai -m query --windows --window | jq -r '."is-floating"')
  if [ "$isFloating" == "true" ]; then
    LABEL="Floating"
    ICON="􀐆"
  else
    LABEL="Tiling"
    ICON="􀧍"
  fi
}

case "$NOTIFICATION_TYPE" in
  "YabaiWindowTypeChanged") yabaiWindowTypeChanged ;;
  *) exit ;;
esac

sketchybar --set "$NAME" label="$LABEL" icon="$ICON"

sketchybar --animate sin 20 --set front_app popup.y_offset=15 popup.y_offset=5
sleep 3
sketchybar --animate sin 20 --set front_app popup.y_offset=-100
