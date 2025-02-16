#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" icon.highlight=on background.drawing=on
    sketchybar --animate sin 15 --set "$NAME" width=40 
else
    sketchybar --set "$NAME" icon.highlight=off background.drawing=off
    sketchybar --animate sin 15 --set "$NAME" width=30
fi
