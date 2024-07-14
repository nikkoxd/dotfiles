#!/bin/sh

spotify=(
  scroll_texts=true
  label.max_chars=35
  popup.background.color=$BACKGROUND
  popup.background.border_width=2
  popup.background.border_color=$ACCENT
  popup.background.corner_radius=5
  update_freq=2
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_shuffle=(
  icon=􀵊
  icon.color=$ACCENT
  icon.background.drawing=off
  label="Toggle Shuffle"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_repeat=(
  icon=􀵌
  icon.color=$ACCENT
  icon.background.drawing=off
  label="Toggle Repeat"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_hide=(
  icon=􀜂
  icon.color=$ACCENT
  icon.background.drawing=off
  label="Toggle Hide Track"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
)

sketchybar --add item spotify center \
           --set spotify "${spotify[@]}" \
           --subscribe spotify mouse.clicked \
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
