#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/constants.sh"

update() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    sketchybar --set "$NAME" icon="vpn_key" background.color="$primary" icon.color="$on_primary"
  else
    sketchybar --set "$NAME" icon="vpn_key_off" background.color="$background" icon.color="$primary"
  fi
}

mouse_clicked() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    scutil --nc stop "$VPN_NAME"
    sketchybar --animate sin 15 --set "$NAME" icon="vpn_key_off" background.color="$background" icon.color="$primary"
  else
    scutil --nc start "$VPN_NAME"
    sketchybar --animate sin 15 --set "$NAME" icon="vpn_key" background.color="$primary" icon.color="$on_primary"
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
