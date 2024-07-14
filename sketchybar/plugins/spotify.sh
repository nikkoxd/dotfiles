#!/bin/sh

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

sketchybar --set "$NAME" label="$ARTIST - $TRACK_NAME"
