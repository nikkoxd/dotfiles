sketchybar --add item layout right \
           --set layout icon=󰗊 script="$PLUGIN_DIR/layout.sh" \
           --add event layout_change "AppleSelectedInputSourcesChangedNotification" \
           --subscribe layout layout_change

