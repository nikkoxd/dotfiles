anchor=(
  icon.padding_left=3
  popup.align=center
  script="$PLUGIN_DIR/volume.sh"
)

slider=(
  padding_left=20
  padding_right=0
  icon.drawing=off
  background.drawing=off
  slider.width=100
  slider.highlight_color=$ACCENT
  slider.knob="􀀁"
  slider.knob.color=$ACCENT
  slider.background.height=6
  slider.background.color=$BACKGROUND2
  slider.background.corner_radius=5
  script="$PLUGIN_DIR/volume.sh"
)

sketchybar --add item volume right \
           --set volume "${anchor[@]}" \
           --subscribe volume volume_change mouse.clicked \
           --add slider volume.slider popup.volume \
           --set volume.slider "${slider[@]}" \
           --subscribe volume.slider mouse.clicked
