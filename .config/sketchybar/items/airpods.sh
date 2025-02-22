sketchybar --add event bluetooth_change "com.apple.bluetooth.status" \
            --add item headphones left \
            --set headphones icon="􀪷" \
            script="$PLUGIN_DIR/airpods.sh" \
            --subscribe headphones bluetooth_change mouse.entered mouse.exited
