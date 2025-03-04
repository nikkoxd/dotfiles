datetime=(
  update_freq=2
  icon="calendar_today"
  script="$PLUGIN_DIR/datetime.sh"
  click_script="open -a Calendar"
)

sketchybar --add item date right \
           --set date "${datetime[@]}"
