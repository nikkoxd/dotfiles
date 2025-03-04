#!/bin/bash

vpn=(
  icon="vpn_key_off"
  icon.padding_left=11
  icon.padding_right=12
  label.drawing=off
  script="$PLUGIN_DIR/vpn.sh"
)

sketchybar --add item vpn right \
           --set vpn "${vpn[@]}" \
           --subscribe vpn mouse.clicked
