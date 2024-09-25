#!/bin/bash

MENU_ITEMS=$("$HELPERS_DIR"/menus/bin/menus -l)

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
    drawing=off
    click_script="$HELPERS_DIR/menus/bin/menus -s $i"
  )
  sketchybar --add item menu.$i left \
             --set      menu.$i "${item[@]}"

  ((i+=1))
done

sketchybar --add bracket menus "/menu\..*/" \
           --set         menus script="$PLUGIN_DIR/menus.sh" \
           --subscribe   menus front_app_switched
