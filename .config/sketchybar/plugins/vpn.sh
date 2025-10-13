#!/bin/bash

source "$HOME/.config/sketchybar/theme.sh"
source "$HOME/.config/sketchybar/constants.sh"

update() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    sketchybar --set "$NAME" background.color="$HIGHLIGHT_COLOR"
  else
    sketchybar --set "$NAME" background.color="0x00000000"
  fi
}

mouse_clicked() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    scutil --nc stop "$VPN_NAME"
    sketchybar --set "$NAME" background.color="0x00000000"
  else
    scutil --nc start "$VPN_NAME"
    sketchybar --set "$NAME" background.color="$HIGHLIGHT_COLOR"
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
