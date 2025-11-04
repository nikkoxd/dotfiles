#!/bin/bash

sketchybar --add event aerospace_workspace_change

WORKSPACES=$(aerospace list-workspaces --all)

# Array to store workspace items for bracket
WORKSPACE_ITEMS=()

for WORKSPACE in $WORKSPACES; do
  sketchybar --add item "space.$WORKSPACE" center \
             --set "space.$WORKSPACE" \
             background.color="$HIGHLIGHT_COLOR" \
             icon="$WORKSPACE" \
             icon.background.color="0x00000000" \
             icon.background.y_offset=-20 \
             icon.width=30 \
             icon.padding_left=0 \
             icon.padding_right=0 \
             icon.font="$FONT:Regular:14.0" \
             icon.align=center \
             icon.color="$TEXT_COLOR" \
             icon.highlight_color="$HIGHLIGHT_COLOR" \
             label.drawing=off \
             script="$CONFIG_DIR/plugins/aerospace.sh $WORKSPACE" \
             --subscribe "space.$WORKSPACE" aerospace_workspace_change mouse.clicked
  
  # Add to workspace items array
  WORKSPACE_ITEMS+=("space.$WORKSPACE")
done
