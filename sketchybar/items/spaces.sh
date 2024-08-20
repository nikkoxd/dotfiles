#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$(($i+1))"
  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    padding_left=0
    padding_right=0
    icon.font="$FONT:Regular:14.0"
    icon.padding_left=10
    icon.padding_right=10
    icon.background.color=$TRANSPARENT
    icon.color=$FOREGROUND
    icon.highlight_color=$ACCENT
    background.color=$BACKGROUND2
    background.border_color=$ACCENT
    background.corner_radius=5
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
  )
  sketchybar --add space space.$sid left \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done

sketchybar --add bracket spaces '/space\..*/' \
           --set         spaces padding_left=15

chevron=(
  icon= 
  icon.font="$FONT:Bold:16.0"
  icon.padding_left=2
  icon.padding_right=10
  icon.color=$ACCENT
  label.drawing=off
  background.corner_radius=5
  click_script="yabai -m space --create && sketchybar --trigger space_change"
)

sketchybar --add item chevron left \
           --set chevron "${chevron[@]}"

sketchybar --add item front_app left \
           --set front_app script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
