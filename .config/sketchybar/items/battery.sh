battery=(
    update_freq=60
    script="$HOME/.config/sketchybar/plugins/battery.sh"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery system_woke power_source_change

