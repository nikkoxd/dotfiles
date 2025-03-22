#!/bin/bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

source "$CONFIG_DIR/plugins/icon_map.sh"

if [ "$SENDER" = "front_app_switched" ]; then
  __icon_map "${INFO}"
  sketchybar --animate sin 15 --set "$NAME" icon="${icon_result}" label="$INFO" icon.font="sketchybar-app-font:Regular:17.0"
fi
