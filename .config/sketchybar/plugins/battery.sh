#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="􀛨"
  ;;
  [6-8][0-9]) ICON="􀺸"
  ;;
  [3-5][0-9]) ICON="􀺶"
  ;;
  [1-2][0-9]) ICON="􀛩"
  ;;
  *) ICON="􀛪"
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋"
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
