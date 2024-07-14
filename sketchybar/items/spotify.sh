#!/bin/sh

spotify=(
  update_freq=2
  script="$PLUGIN_DIR/spotify.sh"
)

sketchybar --add item spotify center \
           --set spotify "${spotify[@]}" \
           --subscribe spotify mouse.clicked
