separator=(
    label="|"
    icon.drawing=off
    label.padding_left=3
    label.padding_right=3
)

name="separator$RANDOM"

sketchybar  --add item "$name" "left" \
            --set "$name" "${separator[@]}"
