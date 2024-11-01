#!/bin/bash

sketchybar --add item wifi right                  \
           --set wifi script="$PLUGIN_DIR/wifi.sh" \
                     updates=on                  \
                     icon.padding_right=10       \
                     label.drawing=off           \
           --subscribe wifi wifi_change
