flower=(
  icon="󰧲"
  icon.padding_right=10
  label.drawing=off
  click_script="$PLUGIN_DIR/flower.sh"
)
sketchybar --add item flower left \
           --set flower "${flower[@]}"
