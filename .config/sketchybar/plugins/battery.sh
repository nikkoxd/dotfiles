#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="battery_full"
  ;;
  [6-8][0-9]) ICON="battery_5_bar"
  ;;
  [3-5][0-9]) ICON="battery_4_bar"
  ;;
  [1-2][0-9]) ICON="battery_2_bar"
  ;;
  *) ICON="battery_1_bar"
esac

if [[ "$CHARGING" != "" ]]; then
  case "${PERCENTAGE}" in
    9[0-9]|100) ICON="battery_charging_full"
      ;;
    [6-8][0-9]) ICON="battery_charging_80"
      ;;
    [3-5][0-9]) ICON="battery_charging_50"
      ;;
    [1-2][0-9]) ICON="battery_charging_30"
      ;;
    *) ICON="battery_charging_20"
  esac
  BACKGROUND="$primary"
  ICON_COLOR="$on_primary"
  COLOR="$on_primary"
else
  BACKGROUND="$background"
  ICON_COLOR="$primary"
  COLOR="$on_surface"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
# sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
sketchybar --animate sin 15 --set "$NAME" icon="$ICON" icon.color="$ICON_COLOR" label.color="$COLOR" background.color="$BACKGROUND" label="${PERCENTAGE}%"
