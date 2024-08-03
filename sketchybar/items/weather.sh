weather=(
  icon=􀿩
  label="N/A"
  update_freq=60
  script="$PLUGIN_DIR/weather.sh"
)

sketchybar --add item weather left \
           --set weather "${weather[@]}"
