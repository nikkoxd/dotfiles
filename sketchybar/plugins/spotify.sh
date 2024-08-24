#!/bin/bash

disable_popup() {
  sketchybar --set spotify popup.drawing=off
}

update() {
  if [ "$NAME" == "spotify" ]; then
    IS_RUNNING=$(osascript -e 'tell application "System Events" to (name of processes) contains "Spotify"')

    if [ "$IS_RUNNING" == true ]; then
      sketchybar --set "$NAME" drawing=on

      STATE=$(osascript -e 'tell application "Spotify" to player state')
      ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
      TRACK_NAME=$(osascript -e 'tell application "Spotify" to name of current track')

      case "$STATE" in
        "playing")
          sketchybar --set "$NAME" icon="􀊆" icon.padding_right=7
          ;;
        "paused")
          sketchybar --set "$NAME" icon="􀊄" icon.padding_right=5
          ;;
      esac

      sketchybar --animate sin 30 --set "$NAME" label="$ARTIST - $TRACK_NAME"
    else
      sketchybar --set "$NAME" drawing=off
    fi
  fi
}

spotify() {
  if [ "$BUTTON" = "left" ]; then
    osascript -e 'tell application "Spotify" to playpause'
    update
  else
    sketchybar --set "$NAME" popup.drawing=toggle
  fi
}

next() {
  osascript -e 'tell application "Spotify" to next track'
  disable_popup
  update
}

prev() {
  osascript -e 'tell application "Spotify" to previous track'
  disable_popup
  update
}

shuffle() {
  SHUFFLE=$(osascript -e 'tell application "Spotify" to shuffling')
  if [ "$SHUFFLE" == "false" ]; then
    osascript -e 'tell application "Spotify" to set shuffling to true'
    disable_popup
    sketchybar --animate sin 30 --set spotify label="Shuffling is on"
    sleep 2
    update
  else
    osascript -e 'tell application "Spotify" to set shuffling to false'
    disable_popup
    sketchybar --animate sin 30 --set spotify label="Shuffling is off"
    sleep 2
    update
  fi
}

repeat() {
  REPEAT=$(osascript -e 'tell application "Spotify" to repeating')
  if [ "$REPEAT" == "false" ]; then
    osascript -e 'tell application "Spotify" to set repeating to true'
    disable_popup
    sketchybar --animate sin 30 --set spotify label="Repeat is on"
    sleep 2
    update
  else
    osascript -e 'tell application "Spotify" to set repeating to false'
    disable_popup
    sketchybar --animate sin 30 --set spotify label="Repeat is off"
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
