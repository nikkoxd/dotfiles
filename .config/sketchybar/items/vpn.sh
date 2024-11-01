#!/bin/bash

vpn=(
  icon="󰖂"
  icon.padding_right=9
  label.drawing=off
  script="$PLUGIN_DIR/vpn.sh"
)

sketchybar --add item vpn right \
           --set vpn "${vpn[@]}" \
           --subscribe vpn mouse.clicked
