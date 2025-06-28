airpods=(
    icon="􀪷"
    update_freq=5
    script="$HOME/.config/sketchybar/plugins/airpods.sh"
)

sketchybar --add event bluetooth_change "com.apple.bluetooth.status" \
            --add item airpods left \
            --set airpods "${airpods[@]}" \
            --subscribe headphones mouse.entered mouse.exited
