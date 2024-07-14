#!/bin/bash

update() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    sketchybar --set "$NAME" label=$VPN
  else
    sketchybar --set "$NAME" label="Off"
  fi
}

mouse_clicked() {
  VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

  if [[ $VPN != "" ]]; then
    scutil --nc stop "Aeza"
    sketchybar --set "$NAME" label="Off"
  else
    scutil --nc start "Aeza"
    sketchybar --set "$NAME" label="Aeza"
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
