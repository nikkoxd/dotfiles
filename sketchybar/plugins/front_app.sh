#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

source "$CONFIG_DIR/plugins/icon_map.sh"

case "$SENDER" in
  "front_app_switched")
    __icon_map "${INFO}"
    sketchybar --set "$NAME" icon="${icon_result}" label="$INFO" icon.font="sketchybar-app-font:Regular:17.0"
    ;;
  "mouse.clicked")
    DRAWING=$(sketchybar --query menu.1 | jq -r ".geometry.drawing")

    if [ "$DRAWING" == "on" ]; then
      sketchybar --set '/menu\..*/' drawing=off \
                 --set weather drawing=on \
                 --set mic drawing=on
    else
      sketchybar --set '/menu\..*/' drawing=on \
                 --set weather drawing=off \
                 --set mic drawing=off
      source "$HOME/.config/sketchybar/plugins/menus.sh"
    fi
    ;;
esac
