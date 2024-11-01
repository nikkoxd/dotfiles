datetime=(
  update_freq=2
  padding_right=10
  icon=􀐫
  script="$PLUGIN_DIR/datetime.sh"
  click_script="open -a Calendar"
)

sketchybar --add item date right \
           --set date "${datetime[@]}"
