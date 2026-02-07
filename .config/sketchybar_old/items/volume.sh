anchor=(
  popup.align=center
  script="$HOME/.config/sketchybar/plugins/volume.sh"
)

slider=(
  padding_left=15
  padding_right=15
  icon.drawing=off
  label.drawing=off
  background.drawing=off

  slider.width=100
  slider.highlight_color="0xffcccccc"

  slider.knob="|"
  slider.knob.y_offset=1
  slider.knob.width=10
  slider.knob.color="0xffcccccc"

  slider.background.height=4
  slider.background.color="0xff2a2a2a"
  slider.background.corner_radius=5

  script="$HOME/.config/sketchybar/plugins/volume.sh"
)

sketchybar --add item volume right \
           --set volume "${anchor[@]}" \
           --subscribe volume volume_change mouse.clicked \
           --add slider volume.slider popup.volume \
           --set volume.slider "${slider[@]}" \
           --subscribe volume.slider mouse.clicked
