anchor=(
  popup.align=center
  script="$PLUGIN_DIR/volume.sh"
)

slider=(
  padding_left=15
  padding_right=15
  icon.drawing=off
  label.drawing=off
  background.drawing=off
  slider.width=100
  slider.highlight_color="$primary"
  slider.knob="|"
  slider.knob.y_offset=1
  slider.knob.width=10
  slider.knob.color="$primary"
  slider.background.height=4
  slider.background.color="$surface_container"
  slider.background.corner_radius=5
  script="$HOME/.config/sketchybar/plugins/volume.sh"
)

sketchybar --add item volume right \
           --set volume "${anchor[@]}" \
           --subscribe volume volume_change mouse.clicked \
           --add slider volume.slider popup.volume \
           --set volume.slider "${slider[@]}" \
           --subscribe volume.slider mouse.clicked
