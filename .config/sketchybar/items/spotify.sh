#!/bin/bash

spotify=(
  padding_left=15
  padding_right=15
  scroll_texts=true
  icon.font="$FONT:Regular:16.0"
  label.max_chars=35
  popup.horizontal=on
  popup.align=center
  popup.height=150
  # popup.scroll_texts=on
  update_freq=2
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_cover=(
  label.drawing=off
  icon.drawing=off
  padding_left=12
  padding_right=10
  background.image.scale=0.2
  background.image.drawing=on
  background.drawing=on
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_label=(
  icon.drawing=off
  background.drawing=off
  label="Label"
  label.font="$FONT:Bold:18.0"
  label.max_chars=25
  width=0
  padding_left=0
  padding_right=0
  y_offset=50
)

spotify_artist=(
  icon.drawing=off
  background.drawing=off
  label="Artist"
  label.max_chars=35
  width=0
  padding_left=0
  padding_right=0
  y_offset=25
)

spotify_album=(
  icon.drawing=off
  background.drawing=off
  label="Album"
  label.max_chars=35
  width=0
  padding_left=0
  padding_right=0
)

spotify_shuffle=(
  icon=􀵊
  icon.color="$primary"
  label.drawing=off
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-35
)

spotify_prev=(
  icon=􁋯
  icon.color="$primary"
  label.drawing=off
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-35
)

spotify_play_pause=(
  icon.color="$primary"
  label.drawing=off
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-35
)

spotify_next=(
  icon=􁋱
  icon.color="$primary"
  label.drawing=off
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-35
)

spotify_repeat=(
  icon=􀵌
  icon.color="$primary"
  label.drawing=off
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-35
)

spotify_hide=(
  icon=􀜂
  icon.color="$primary"
  label.drawing=off
  padding_right=10
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-35
)

sketchybar --add item spotify center \
           --set spotify "${spotify[@]}" \
           --subscribe spotify mouse.clicked \
           \
           --add item spotify.cover popup.spotify \
           --set spotify.cover "${spotify_cover[@]}" \
           --subscribe spotify.cover mouse.clicked \
           \
           --add item spotify.label popup.spotify \
           --set spotify.label "${spotify_label[@]}" \
           --subscribe spotify.label mouse.clicked \
           \
           --add item spotify.artist popup.spotify \
           --set spotify.artist "${spotify_artist[@]}" \
           --subscribe spotify.artist mouse.clicked \
           \
           --add item spotify.album popup.spotify \
           --set spotify.album "${spotify_album[@]}" \
           --subscribe spotify.album mouse.clicked \
           \
           --add item spotify.shuffle popup.spotify \
           --set spotify.shuffle "${spotify_shuffle[@]}" \
           --subscribe spotify.shuffle mouse.clicked \
           \
           --add item spotify.prev popup.spotify \
           --set spotify.prev "${spotify_prev[@]}" \
           --subscribe spotify.prev mouse.clicked \
           \
           --add item spotify.play_pause popup.spotify \
           --set spotify.play_pause "${spotify_play_pause[@]}" \
           --subscribe spotify.play_pause mouse.clicked \
           \
           --add item spotify.next popup.spotify \
           --set spotify.next "${spotify_next[@]}" \
           --subscribe spotify.next mouse.clicked \
           \
           --add item spotify.repeat popup.spotify \
           --set spotify.repeat "${spotify_repeat[@]}" \
           --subscribe spotify.repeat mouse.clicked \
           \
           --add item spotify.hide popup.spotify \
           --set spotify.hide "${spotify_hide[@]}" \
           --subscribe spotify.hide mouse.clicked
