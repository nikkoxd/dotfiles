#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  space=(
    icon="$(echo "$sid" | tr '[:lower:]' '[:upper:]')"
    padding_left=0
    padding_right=0
    icon.font="$FONT:Regular:14.0"
    width=30
    icon.background.color="$TRANSPARENT"
    icon.color="$on_surface"
    icon.highlight_color="$on_primary"
    background.color="$primary"
    background.corner_radius=100
    label.drawing=off
    click_script="aerospace workspace $sid"
    script="$PLUGIN_DIR/space.sh $sid"
  )

  sketchybar --add item space."$sid" center \
    --subscribe space."$sid" aerospace_workspace_change \
    --set space."$sid"  "${space[@]}"
done

sketchybar --add bracket spaces '/space\..*/' \
           --set         spaces padding_left=15
