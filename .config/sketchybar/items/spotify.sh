#!/bin/bash

spotify=(
  padding_left=10
  padding_right=10
  scroll_texts=true
  icon.font="$FONT:Regular:16.0"
  icon.padding_left=10
  icon.padding_right=14
  label.max_chars=35
  label.padding_left=0
  label.padding_right=10
  update_freq=2
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_next=(
  icon=􁋱
  icon.color="$ACCENT"
  background.drawing=off
  label="Next Track"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_prev=(
  icon=􁋯
  icon.color="$ACCENT"
  background.drawing=off
  label="Previous Track"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_shuffle=(
  icon=􀵊
  icon.color="$ACCENT"
  background.drawing=off
  label="Toggle Shuffle"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_repeat=(
  icon=􀵌
  icon.color="$ACCENT"
  background.drawing=off
  label="Toggle Repeat"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_hide=(
  icon=􀜂
  icon.color="$ACCENT"
  background.drawing=off
  label="Toggle Hide Track"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
)

sketchybar --add item spotify center \
           --set spotify "${spotify[@]}" \
           --subscribe spotify mouse.clicked \
           \
           --add item spotify.next popup.spotify \
           --set spotify.next "${spotify_next[@]}" \
           --subscribe spotify.next mouse.clicked \
           \
           --add item spotify.prev popup.spotify \
           --set spotify.prev "${spotify_prev[@]}" \
           --subscribe spotify.prev mouse.clicked \
           \
           --add item spotify.shuffle popup.spotify \
           --set spotify.shuffle "${spotify_shuffle[@]}" \
           --subscribe spotify.shuffle mouse.clicked \
           \
           --add item spotify.repeat popup.spotify \
           --set spotify.repeat "${spotify_repeat[@]}" \
           --subscribe spotify.repeat mouse.clicked \
           \
           --add item spotify.hide popup.spotify \
           --set spotify.hide "${spotify_hide[@]}" \
           --subscribe spotify.hide mouse.clicked
