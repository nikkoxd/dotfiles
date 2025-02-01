sketchybar --add item battery right \
           --set battery icon.padding_left=10 update_freq=60 script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change

