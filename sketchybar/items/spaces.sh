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
    icon.font="$FONT:Bold:16.0"
    icon.padding_left=10
    icon.padding_right=10
    icon.highlight_color=$BLACK
    background.color=$ACCENT
    background.corner_radius=5
    background.height=25
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
  )
  sketchybar --add space space.$sid left \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done

spaces=(
  background.color=$BACKGROUND2
  background.border_color=$ACCENT
  background.border_width=2
  background.corner_radius=5
  background.height=25
  background.drawing=on
)

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces[@]}"

chevron=(
  icon= 
  padding_left=10
  icon.font="$FONT:Bold:14.0"
  icon.padding_left=7
  icon.padding_right=5
  icon.color=$BLACK
  label.drawing=off
  background.color=$ACCENT
  background.height=25
  background.corner_radius=5
  click_script="yabai -m space --create && sketchybar --trigger space_change"
)

sketchybar --add item chevron left \
           --set chevron "${chevron[@]}"

sketchybar --add item front_app left \
           --set front_app script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
