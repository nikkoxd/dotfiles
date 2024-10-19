#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
# SPACE_ICONS=("一" "二" "三" "四" "五" "六" "七" "八" "九" "十")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$((i+1))"
  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    padding_left=0
    padding_right=0
    icon.font="$FONT:Regular:14.0"
    width=31
    icon.background.color="$TRANSPARENT"
    icon.color="$text"
    icon.highlight_color="$background"
    background.color="$primary"
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
