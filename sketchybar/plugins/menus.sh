DRAWING=$(sketchybar --query menu.1 | jq -r ".geometry.drawing")

if [ "$DRAWING" == "on" ]; then
  MENU_ITEMS="$($HOME/.config/sketchybar/helpers/menus/bin/menus -l)"

  sketchybar --set '/menu\..*/' drawing=off

  i=1
  for name in $MENU_ITEMS
  do
    item=(
      label="$name"
      drawing=on
      padding_left=0
      padding_right=0
      icon.drawing=off
      click_script="$HOME/.config/sketchybar/helpers/menus/bin/menus -s $i"
    )
    sketchybar --set menu.$i "${item[@]}"

    ((i+=1))
  done
fi
