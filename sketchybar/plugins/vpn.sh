#!/bin/bash

source "colors.sh"

update() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    sketchybar --set "$NAME" icon.color=$ACCENT
  else
    sketchybar --set "$NAME" icon.color=$DISABLED
  fi
}

mouse_clicked() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    scutil --nc stop "Aeza"
    sketchybar --set "$NAME" icon.color=$DISABLED
  else
    scutil --nc start "Aeza"
    sketchybar --set "$NAME" icon.color=$ACCENT
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
