#!/bin/bash

source "$HOME/.config/sketchybar/colors-my.sh"
source "$HOME/.config/sketchybar/constants.sh"

update() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    sketchybar --set "$NAME" background.color="$primary" icon.color="$background"
  else
    sketchybar --set "$NAME" background.color="$containerBackground" icon.color="$primary"
  fi
}

mouse_clicked() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    scutil --nc stop "$vpn_name"
    sketchybar --set "$NAME" background.color="$containerBackground" icon.color="$primary"
  else
    scutil --nc start "$vpn_name"
    sketchybar --set "$NAME" background.color="$primary" icon.color="$background"
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
