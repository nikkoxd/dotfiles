#!/bin/bash

front_app=(
  popup.drawing=on
  popup.y_offset=-100
  script="$PLUGIN_DIR/front_app.sh"
)

# notification=(
#   label="Notification"
#   icon="􀋚"
#   script="$PLUGIN_DIR/notification.sh"
# )

sketchybar --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched

# sketchybar --add event notification_triggered \
#            --add item notification popup.front_app \
#            --set notification "${notification[@]}" \
#            --subscribe notification notification_triggered
