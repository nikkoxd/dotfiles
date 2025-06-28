battery=(
    update_freq=60
    script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery system_woke power_source_change

