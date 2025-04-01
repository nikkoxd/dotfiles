#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

disable_popup() {
  sketchybar --set spotify popup.drawing=off
}

set_label() {
  ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
  TRACK_NAME=$(osascript -e 'tell application "Spotify" to name of current track')
  ALBUM=$(osascript -e 'tell application "Spotify" to album of current track')

  sketchybar --animate sin 30 --set "$NAME" label="$ARTIST - $TRACK_NAME"

  sketchybar --set spotify.label label="$TRACK_NAME"
  sketchybar --set spotify.artist label="$ARTIST"
  sketchybar --set spotify.album label="$ALBUM"
}

set_cover() {
  COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')

  curl -s --max-time 20 "$COVER" -o /tmp/cover.png
  magick -size 640x640 xc:none -draw "roundrectangle 0,0,640,640,50,50" /tmp/mask.png
  magick /tmp/cover.png -gravity Center -extent 1:1 -resize 640x640 -alpha set /tmp/mask.png -compose DstIn -composite /tmp/cover.png

  sketchybar --set spotify.cover background.image="/tmp/cover.png"
  sketchybar --set spotify icon.background.image="/tmp/cover.png"
}

update() {
  if [ "$NAME" == "spotify" ]; then
    STATE=$(echo "$INFO" | jq -r '.["Player State"]')

    if [ "$IS_RUNNING" == true ] || [ "$SENDER" != "spotify_playback_state_changed" ]; then
      STATE=$(osascript -e 'tell application "Spotify" to player state' | perl -ne 'print ucfirst')
    fi

    if [ "$STATE" == "Playing" ] || [ "$STATE" == "Paused" ]; then
      sketchybar --set "$NAME" drawing=on

      # STATE=$(osascript -e 'tell application "Spotify" to player state')
      SHUFFLE=$(osascript -e 'tell application "Spotify" to shuffling')
      REPEAT=$(osascript -e 'tell application "Spotify" to repeating')

      if [ "$SHUFFLE" == "true" ]; then
        sketchybar --animate sin 15 --set spotify.shuffle background.color="$primary" icon.color="$on_primary"
      else
        sketchybar --animate sin 15 --set spotify.shuffle background.color="$surface" icon.color="$primary"
      fi

      if [ "$REPEAT" == "true" ]; then
        sketchybar --animate sin 15 --set spotify.repeat background.color="$primary" icon.color="$on_primary"
      else
        sketchybar --animate sin 15 --set spotify.repeat background.color="$surface" icon.color="$primary"
      fi

      case "$STATE" in
        "Playing")
          sketchybar --set spotify.play_pause icon="􀊆"
          set_cover &
          set_label &
          wait $!
          ;;
        "Paused")
          sketchybar --set spotify.play_pause icon="􀊄"
          set_cover & 
          set_label &
          wait $!
          ;;
        "Stopped")
          sketchybar --set "$NAME" label="Nothing is playing"
          ;;
      esac
    else
      sketchybar --set "$NAME" drawing=off
    fi
  fi
}

spotify() {
  sketchybar --set "$NAME" popup.drawing=toggle
}

play_pause() {
  osascript -e 'tell application "Spotify" to playpause'
  update
}

next() {
  osascript -e 'tell application "Spotify" to next track'
  update
}

prev() {
  osascript -e 'tell application "Spotify" to previous track'
  update
}

shuffle() {
  SHUFFLE=$(osascript -e 'tell application "Spotify" to shuffling')
  if [ "$SHUFFLE" == "false" ]; then
    osascript -e 'tell application "Spotify" to set shuffling to true'
    sketchybar --animate sin 15 --set spotify.shuffle background.color="$primary" icon.color="$on_primary"
    sleep 2
    update
  else
    osascript -e 'tell application "Spotify" to set shuffling to false'
    sketchybar --animate sin 15 --set spotify.shuffle background.color="$surface_container" icon.color="$primary"
    sleep 2
    update
  fi
}

repeat() {
  REPEAT=$(osascript -e 'tell application "Spotify" to repeating')
  if [ "$REPEAT" == "false" ]; then
    osascript -e 'tell application "Spotify" to set repeating to true'
    sketchybar --animate sin 15 --set spotify.repeat background.color="$primary" icon.color="$on_primary"
    sleep 2
    update
  else
    osascript -e 'tell application "Spotify" to set repeating to false'
    sketchybar --animate sin 15 --set spotify.repeat background.color="$surface_container" icon.color="$primary"
    sleep 2
    update
  fi
}

hide() {
  WIDTH=$(sketchybar --query spotify | jq -r ".label.width")
  if [ "$WIDTH" != 0 ]; then
    sketchybar --animate sin 30 --set spotify label.width=0
  else
    sketchybar --animate sin 30 --set spotify label.width=dynamic
  fi
  disable_popup
}

mouse_clicked() {
  case "$NAME" in
    "spotify") spotify
    ;;
    "spotify.play_pause") play_pause
    ;;
    "spotify.next") next
    ;;
    "spotify.prev") prev
    ;;
    "spotify.shuffle") shuffle
    ;;
    "spotify.repeat") repeat
    ;;
    "spotify.hide") hide
    ;;
    *)
    ;;
  esac
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
