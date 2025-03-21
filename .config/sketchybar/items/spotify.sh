#!/bin/bash

spotify=(
  padding_left=15
  padding_right=15
  scroll_texts=true
  icon=":spotify:"
  icon.font="sketchybar-app-font:Regular:17.0"
  label.max_chars=35
  # popup.drawing=on
  popup.horizontal=on
  popup.align=center
  popup.height=185
  # popup.scroll_texts=on
  update_freq=2
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_cover=(
  label.drawing=off
  icon.drawing=off
  padding_left=25
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
  label.max_chars=24
  scroll_texts=true
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
  scroll_texts=true
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
  scroll_texts=true
  width=0
  padding_left=0
  padding_right=0
)

spotify_shuffle=(
  width=31
  background.color="$surface"
  icon="shuffle"
  icon.color="$primary"
  icon.font="$ICON_FONT:Regular:18.0"
  icon.padding_left=6
  label.drawing=off
  background.border_width=0
  padding_left=15
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
  shadow=off
)

spotify_prev=(
  width=31
  padding_left=5
  background.color="$primary"
  icon="skip_previous"
  icon.color="$on_primary"
  icon.font="$ICON_FONT_FILLED:Regular:18.0"
  icon.padding_left=6
  label.drawing=off
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
)

spotify_play_pause=(
  width=81
  padding_left=10
  background.color="$surface_container"
  background.height=45
  icon.color="$on_primary"
  icon.font="$ICON_FONT_FILLED:Regular:18.0"
  icon.padding_left=31
  background.color="$primary"
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
)

spotify_next=(
  width=31
  padding_left=10
  background.color="$primary"
  icon="skip_next"
  icon.color="$on_primary"
  icon.font="$ICON_FONT_FILLED:Regular:18.0"
  icon.padding_left=7
  label.drawing=off
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
)

spotify_repeat=(
  width=31
  padding_left=5
  background.color="$surface"
  icon="repeat"
  icon.color="$primary"
  icon.font="$ICON_FONT:Regular:18.0"
  icon.padding_left=7
  label.drawing=off
  padding_right=25
  background.border_width=0
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-45
  shadow=off
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
           --subscribe spotify.repeat mouse.clicked
