#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$((i+1))"
  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    padding_left=0
    padding_right=0
    icon.font="$FONT:Regular:14.0"
    icon.padding_left=11
    icon.padding_right=13
    icon.background.color="$TRANSPARENT"
    icon.color="$FOREGROUND"
    icon.highlight_color="$BACKGROUND"
    background.color="$ACCENT"
    background.corner_radius=100
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
  )
  sketchybar --add space space.$sid center \
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
  icon.color="$ACCENT"
  label.drawing=off
  background.corner_radius=5
  click_script="yabai -m space --create && sketchybar --trigger space_change"
)

sketchybar --add item chevron center \
           --set chevron "${chevron[@]}"
