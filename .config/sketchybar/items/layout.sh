sketchybar --add item layout right \
           --set layout icon="translate" script="$PLUGIN_DIR/layout.sh" \
           --add event layout_change "AppleSelectedInputSourcesChangedNotification" \
           --subscribe layout layout_change

