weather=(
  icon=􀇗
  label="N/A"
  update_freq=60
  script="$PLUGIN_DIR/weather.sh"
)

weather_condition=(
  label="Sunny"
  icon.drawing=off
  background.drawing=off
)

weather_temp=(
  label="Feels like N/A"
  icon.drawing=off
  background.drawing=off
)

sketchybar --add item weather left \
           --set weather "${weather[@]}" \
           --subscribe weather mouse.clicked wifi_change \
           \
           --add item weather.condition popup.weather \
           --set weather.condition "${weather_condition[@]}" \
           \
           --add item weather.temp popup.weather \
           --set weather.temp "${weather_temp[@]}"
