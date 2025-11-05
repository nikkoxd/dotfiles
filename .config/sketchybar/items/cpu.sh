cpu=(
    icon="􀧓"
    update_freq=60
    script="$HOME/.config/sketchybar/plugins/cpu.sh"
)

sketchybar --add item cpu left \
    --set cpu "${cpu[@]}"
