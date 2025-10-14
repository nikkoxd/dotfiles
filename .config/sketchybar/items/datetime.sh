datetime=(
  update_freq=2
  # icon=􀐬
  script="$HOME/.config/sketchybar/plugins/datetime.sh"
  click_script="open -a Calendar"
)

sketchybar --add item date right \
           --set date "${datetime[@]}"
