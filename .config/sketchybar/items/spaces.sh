#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
# SPACE_ICONS=("一" "二" "三" "四" "五" "六" "七" "八" "九" "十")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$((i+1))"
  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    icon.font="$FONT:Regular:14.0"
    icon.background.color="$TRANSPARENT"
    icon.color="$on_surface"
    icon.highlight_color="$on_primary"
    icon.align=center
    icon.padding_left=0
    icon.padding_right=0
    icon.y_offset=1
    label.drawing=off
    script="$HOME/.config/sketchybar/plugins/space.sh"
  )
  sketchybar --add space space.$sid center \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done
