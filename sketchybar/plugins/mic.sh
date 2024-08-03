#!/bin/sh

update() {
  MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

  if [[ $MIC_VOLUME -eq 0 ]]; then
    sketchybar --set "$NAME" icon="􀊳"
  elif [[ $MIC_VOLUME -eq 100 ]]; then
    sketchybar --set "$NAME" icon="􀊱"
  else
    osascript -e 'set volume input volume 100'
  fi
}

mouse_clicked() {
  MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

  if [[ $MIC_VOLUME -eq 0 ]]; then
    osascript -e 'set volume input volume 100'
    sketchybar --set "$NAME" icon="􀊳"
  elif [[ $MIC_VOLUME -gt 0 ]]; then
    osascript -e 'set volume input volume 0'
    sketchybar --set "$NAME" icon="􀊱"
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
