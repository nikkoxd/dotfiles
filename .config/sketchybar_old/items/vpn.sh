#!/bin/bash

vpn=(
  icon="󰖂"
  icon.padding_left=12
  icon.padding_right=10
  label.drawing=off
  script="$HOME/.config/sketchybar/plugins/vpn.sh"
)

sketchybar --add item vpn right \
           --set vpn "${vpn[@]}" \
           --subscribe vpn mouse.clicked
