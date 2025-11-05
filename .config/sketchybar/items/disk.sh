disk=(
    icon="􀤃"
    update_freq=60
    script="$HOME/.config/sketchybar/plugins/disk.sh"
)

sketchybar --add item disk left \
    --set disk "${disk[@]}"
