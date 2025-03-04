flower=(
  icon="spa"
  icon.padding_right=12
  label.drawing=off
  click_script="$PLUGIN_DIR/flower.sh"
)
sketchybar --add item flower left \
           --set flower "${flower[@]}"
