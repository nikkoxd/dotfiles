ram=(
    icon="􀧖"
    update_freq=60
    script="$HOME/.config/sketchybar/plugins/ram.sh"
)

sketchybar --add item ram left \
    --set ram "${ram[@]}"
