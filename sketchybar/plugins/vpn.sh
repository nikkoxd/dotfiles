#!/bin/bash

source "colors.sh"

update() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    sketchybar --set "$NAME" background.color="$ACCENT" icon.color="$BACKGROUND"
  else
    sketchybar --set "$NAME" background.color="$BACKGROUND2" icon.color="$ACCENT"
  fi
}

mouse_clicked() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    scutil --nc stop "SFM"
    sketchybar --set "$NAME" background.color="$BACKGROUND2" icon.color="$ACCENT"
  else
    scutil --nc start "SFM"
    sketchybar --set "$NAME" background.color="$ACCENT" icon.color="$BACKGROUND"
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
