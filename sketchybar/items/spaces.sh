#!/bin/bash

for sid in $(aerospace list-workspaces --all); do
  space=(
    padding_left=0
    padding_right=0
    label="$sid"
    background.color="$BACKGROUND2"
    background.corner_radius=0
    background.drawing=off
    icon.drawing=off
    script="$PLUGIN_DIR/space.sh $sid"
  )
  sketchybar --add item "space.$sid" left \
             --set "space.$sid" "${space[@]}" \
             --subscribe "space.$sid" mouse.clicked aerospace_workspace_change
done

sketchybar --add bracket spaces '/space\..*/' \

chevron=(
  icon= 
  icon.font="$FONT:Bold:16.0"
  icon.padding_left=2
  icon.padding_right=10
  icon.color="$ACCENT"
  label.drawing=off
  background.corner_radius=5
  click_script="yabai -m space --create && sketchybar --trigger space_change"
)

sketchybar --add item chevron left \
           --set chevron "${chevron[@]}"

sketchybar --add item front_app left \
           --set front_app script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
