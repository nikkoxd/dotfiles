sketchybar --add event bluetooth_change "com.apple.bluetooth.status" \
            --add item headphones left \
            --set headphones icon="􀪷" update_freq=5 \
            script="$PLUGIN_DIR/airpods.sh" \
            --subscribe headphones mouse.entered mouse.exited
