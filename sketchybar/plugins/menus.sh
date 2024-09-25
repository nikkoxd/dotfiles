#!/bin/bash

DRAWING=$(sketchybar --query menu.1 | jq -r ".geometry.drawing")
MENU_ITEMS=$("$HOME"/.config/sketchybar/helpers/menus/bin/menus -l)

sketchybar --set '/menu\..*/' drawing=off

i=1
for name in $MENU_ITEMS; do
  item=(
    label="$name"
    background.drawing=off
    padding_left=0
    padding_right=0
    label.padding_left=7
    label.padding_right=7
    icon.drawing=off
    drawing="$DRAWING"
    click_script="$HOME/.config/sketchybar/helpers/menus/bin/menus -s $i"
  )
  sketchybar --set menu.$i "${item[@]}"

  ((i+=1))
done
