#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
# SPACE_ICONS=("一" "二" "三" "四" "五" "六" "七" "八" "九" "十")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$((i+1))"
  space=(
    space="$sid"

    background.color="$HIGHLIGHT_COLOR"

    icon="${SPACE_ICONS[i]}"

    icon.background.color="0x00000000"
    icon.background.y_offset=-20

    icon.width=30
    icon.padding_left=0
    icon.padding_right=0

    icon.font="$FONT:Regular:14.0"
    icon.align=center

    icon.color="$TEXT_COLOR"
    icon.highlight_color="$HIGHLIGHT_COLOR"

    label.drawing=off

    script="$HOME/.config/sketchybar/plugins/space.sh"
  )
  sketchybar --add space space.$sid center \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done
