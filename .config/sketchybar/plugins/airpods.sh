#!/usr/bin/env bash
  
show_both_earbuds() {
  update

  sketchybar --animate sin 15 --set "$NAME" label="Left: $left%, Right: $right%, Case: $case%"
}

update() {
  DEVICES="$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -rc '.SPBluetoothDataType[0].device_connected[] | select ( .[] | .device_minorType == "Headphones")' | jq '.[]')"
  if [ "$DEVICES" = "" ]; then
    sketchybar -m --set "$NAME" drawing=off
  else
    sketchybar -m --set "$NAME" drawing=on
    left="$(echo "$DEVICES" | jq -r .device_batteryLevelLeft | tr -d '[:space:]%')"
    right="$(echo "$DEVICES" | jq -r .device_batteryLevelRight | tr -d '[:space:]%')"
    case="$(echo "$DEVICES" | jq -r .device_batteryLevelCase | tr -d '[:space:]%')"

    if [[ "$left" -gt "$right" ]]; then
      percentage="$right"
    else
      percentage="$left"
    fi

    if [[ "$left" == "null"  ]]; then
      left="Nf"
      percentage="$right"
    fi

    if [[ "$right" == "null" ]]; then
      right='Nf'
      percentage="$left"
    fi

    if [[ "$case" == "null" ]]; then
      case='Nf'
    fi

    sketchybar --animate sin 15 --set "$NAME" label="$percentage%"
  fi
}

case "$SENDER" in
  mouse.entered)
    show_both_earbuds
    ;;
  mouse.exited)
    update
    ;;
  *)
    update
    ;;
esac
