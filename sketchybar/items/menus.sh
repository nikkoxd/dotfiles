MENU_ITEMS="$($HOME/.config/sketchybar/helpers/menus/bin/menus -l)"

i=1
for name in $MENU_ITEMS
do
  item=(
    label="$name"
    drawing=off
    padding_left=0
    padding_right=0
    icon.drawing=off
    click_script="$HOME/.config/sketchybar/helpers/menus/bin/menus -s $i"
  )
  sketchybar --add item menu.$i left \
             --set      menu.$i "${item[@]}"

  ((i+=1))
done

sketchybar --add bracket menus '/menu\..*/' \
           --set         menus script="$PLUGIN_DIR/menus.sh" \
           --subscribe   menus front_app_switched
