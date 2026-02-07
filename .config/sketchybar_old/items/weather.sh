#!/bin/bash

weather=(
  icon=􀇗
  label="N/A"
  update_freq=60
  script="$HOME/.config/sketchybar/plugins/weather.sh"
)

sketchybar --add item weather left \
           --set weather "${weather[@]}" \
           --subscribe weather mouse.clicked mouse.entered mouse.exited wifi_change
