#!/bin/sh

update() {
  IS_RUNNING=$(osascript -e 'tell application "System Events" to (name of processes) contains "Spotify"')

  if [ $IS_RUNNING == true ]; then
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
}

mouse_clicked() {
  osascript -e 'tell application "Spotify" to playpause'
  update
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
