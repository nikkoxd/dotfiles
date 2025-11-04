#!/bin/bash

source "$HOME/.config/sketchybar/theme.sh"

CURRENT=${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}

WINDOW_COUNT=$(aerospace list-windows --workspace "$1" 2>/dev/null | wc -l)

update() {
    if [ "$1" = "$CURRENT" ]; then
        sketchybar --animate cos 15 --set "$NAME" icon.color="$HIGHLIGHT_COLOR" background.y_offset=-15 drawing=on
    elif [ "$WINDOW_COUNT" -eq 0 ]; then
        sketchybar --set "$NAME" drawing=off
    else
        sketchybar --animate cos 15 --set "$NAME" icon.color="$TEXT_COLOR" background.y_offset=-20 drawing=on
    fi
}

mouse_clicked() {
    aerospace workspace "$1"
}

case "$SENDER" in
    "mouse.clicked") mouse_clicked "$@"
        ;;
    *) update "$@"
        ;;
esac
