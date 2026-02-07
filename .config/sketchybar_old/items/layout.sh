layout=(
    icon="󰗊"
    script="$HOME/.config/sketchybar/plugins/layout.sh"
)

sketchybar --add item layout right \
           --set layout "${layout[@]}" \
           --add event layout_change "AppleSelectedInputSourcesChangedNotification" \
           --subscribe layout layout_change

