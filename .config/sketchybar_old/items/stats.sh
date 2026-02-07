stats=(
    icon="􀧓"
    label="0%"
    update_freq=60
    script="$HOME/.config/sketchybar/plugins/stats.sh network"
)

sketchybar --add item stats right \
    --set stats "${stats[@]}" \
    --subscribe stats mouse.clicked wifi_change
