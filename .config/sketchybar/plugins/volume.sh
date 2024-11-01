#!/bin/bash

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

update() {
  VOLUME="$INFO"

  case "$VOLUME" in
    100) 
      ICON="􀊩"
    ;;
    [6-9][0-9]) 
      ICON="􀊧"
    ;;
    [3-5][0-9]) 
      ICON="􀊥"
    ;;
    [1-9]|[1-2][0-9]) 
      ICON="􀊡"
      sketchybar --set "$NAME" icon.padding_right=8
    ;;
    *) ICON="􀊣"
  esac

  sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
  sketchybar --set "$NAME.slider" slider.percentage="$VOLUME"
}

mouse_click() {
  case "$NAME" in
    "volume")
      sketchybar --set "$NAME" popup.drawing=toggle
      ;;
    "volume.slider")
      osascript -e "set volume output volume ${PERCENTAGE}"
      ;;
  esac
}

case "$SENDER" in
  "volume_change") update
    ;;
  "mouse.clicked") mouse_click
    ;;
esac
