generate_tonal_palette() {
  lightness_values=(0 5 10 20 30 40 50 60 70 80 90 95 99 100)

  local color=$1
  local role_name=$2
  local chroma=$3
  local hue_rotation=$4

  if [ -n "$hue_rotation" ]; then
    color=$(pastel rotate "$hue_rotation" "$color" | pastel format hex)
  fi

  for lightness in "${lightness_values[@]}"; do
    var_name="${role_name}_${lightness}"

    color=$(pastel set chroma "$chroma" "$color" | pastel set lightness "$lightness" | pastel format hex | sed 's/#//')

    echo "export $var_name=\"$color\"" >> "$HOME/.cache/wal/colors-materialyou.sh"
    echo "  --$var_name: #$color;" >> "$HOME/.cache/wal/colors-materialyou.css"
  done
}

assign_color_roles() {
  local light_mode=$1

  declare -A color_roles=(
    ["primary"]="primary_80"
    ["on_primary"]="primary_20"
    ["primary_container"]="primary_30"
    ["on_primary_container"]="primary_90"

    ["secondary"]="secondary_80"
    ["on_secondary"]="secondary_20"
    ["secondary_container"]="secondary_30"
    ["on_secondary_container"]="secondary_90"

    ["tertiary"]="tertiary_80"
    ["on_tertiary"]="tertiary_20"
    ["tertiary_container"]="tertiary_30"
    ["on_tertiary_container"]="tertiary_90"

    ["error"]="error_80"
    ["on_error"]="error_20"
    ["error_container"]="error_30"
    ["on_error_container"]="error_90"

    ["surface_dim"]="neutral_10"
    ["surface"]="neutral_10"
    ["surface_bright"]="neutral_20"

    ["surface_container_lowest"]="neutral_5"
    ["surface_container_low"]="neutral_10"
    ["surface_container"]="neutral_10"
    ["surface_container_high"]="neutral_10"
    ["surface_container_highest"]="neutral_20"

    ["on_surface"]="neutral_90"
    ["on_surface_variant"]="neutral_variant_90"
    ["outline"]="neutral_variant_60"
    ["outline_variant"]="neutral_variant_30"

    ["inverse_surface"]="neutral_90"
    ["inverse_on_surface"]="neutral_20"
    ["inverse_primary"]="primary_40"

    ["scrim"]="neutral_0"
    ["shadow"]="neutral_0"
  )

  if [ $light_mode = true ]; then
    color_roles=(
      ["primary"]="primary_40"
      ["on_primary"]="primary_100"
      ["primary_container"]="primary_90"
      ["on_primary_container"]="primary_10"

      ["secondary"]="secondary_40"
      ["on_secondary"]="secondary_100"
      ["secondary_container"]="secondary_90"
      ["on_secondary_container"]="secondary_10"

      ["tertiary"]="tertiary_40"
      ["on_tertiary"]="tertiary_100"
      ["tertiary_container"]="tertiary_90"
      ["on_tertiary_container"]="tertiary_10"

      ["error"]="error_40"
      ["on_error"]="error_100"
      ["error_container"]="error_90"
      ["on_error_container"]="error_10"

      ["surface_dim"]="neutral_90"
      ["surface"]="neutral_99"
      ["surface_bright"]="neutral_99"

      ["surface_container_lowest"]="neutral_100"
      ["surface_container_low"]="neutral_95"
      ["surface_container"]="neutral_95"
      ["surface_container_high"]="neutral_95"
      ["surface_container_highest"]="neutral_90"

      ["on_surface"]="neutral_10"
      ["on_surface_variant"]="neutral_variant_30"
      ["outline"]="neutral_variant_50"
      ["outline_variant"]="neutral_variant_80"

      ["inverse_surface"]="neutral_20"
      ["inverse_on_surface"]="neutral_95"
      ["inverse_primary"]="primary_80"

      ["scrim"]="neutral_0"
      ["shadow"]="neutral_0"
    )
  fi

  for role in "${(@k)color_roles}"; do
    color_variable="${color_roles[$role]}"

    echo "export ${role}=\$$color_variable" >> "$HOME/.cache/wal/colors-materialyou.sh"

    echo "  --${role}: var(--$color_variable);" >> "$HOME/.cache/wal/colors-materialyou.css"
  done
}

generate_colors() {
  local color=$1
  local light_mode=$2

  : > "$HOME/.cache/wal/colors-materialyou.sh"
  echo ":root {" > "$HOME/.cache/wal/colors-materialyou.css"

  generate_tonal_palette $color "primary" 50
  generate_tonal_palette $color "secondary" 30
  generate_tonal_palette $color "tertiary" 45 60
  generate_tonal_palette $color "error" 80
  generate_tonal_palette $color "neutral" 4
  generate_tonal_palette $color "neutral_variant" 8

  echo "" >> "$HOME/.cache/wal/colors-materialyou.sh"
  echo "" >> "$HOME/.cache/wal/colors-materialyou.css"

  assign_color_roles "$light_mode"

  echo "}" >> "$HOME/.cache/wal/colors-materialyou.css"
}

generate_pywal_theme() {
  local image=$1
  local light_mode=$2
  source "$HOME/.cache/wal/colors-materialyou.sh"

  local theme_path="$HOME/.config/wal/colorschemes/dark/myou.json"
  if ! [ -e "$theme_path" ] ; then
    touch "$theme_path"
  fi

  local background=$neutral_10
  local foreground=$neutral_95
  local cursor=$neutral_95
  local color0=$neutral_10
  local color1=$tertiary_80
  local color2=$tertiary_60
  local color3=$primary_40
  local color4=$primary_80
  local color5=$secondary_80
  local color6=$secondary_70
  local color7=$neutral_80
  local color8=$neutral_variant_40
  local color9=$tertiary_90
  local color10=$tertiary_70
  local color11=$primary_50
  local color12=$primary_90
  local color13=$secondary_90
  local color14=$secondary_80
  local color15=$neutral_90

  if [ $light_mode = true ]; then
    background=$neutral_90
    foreground=$neutral_10
    cursor=$neutral_10
    color0=$neutral_90
    color1=$tertiary_40
    color2=$tertiary_30
    color3=$primary_30
    color4=$primary_40
    color5=$secondary_40
    color6=$secondary_30
    color7=$neutral_40
    color8=$neutral_variant_30
    color9=$tertiary_60
    color10=$tertiary_50
    color11=$primary_50
    color12=$primary_60
    color13=$secondary_60
    color14=$secondary_50
    color15=$neutral_60
  fi

  echo "{" > $theme_path
  echo "    \"wallpaper\": \"$image\"," >> $theme_path
  echo "    \"alpha\": \"100\"," >> $theme_path
  echo "    \"special\": {" >> $theme_path
  echo "        \"background\": \"#$background\"," >> $theme_path
  echo "        \"foreground\": \"#$foreground\"," >> $theme_path
  echo "        \"cursor\": \"#$cursor\"" >> $theme_path
  echo "    }," >> $theme_path
  echo "    \"colors\": {" >> $theme_path
  echo "        \"color0\": \"#$color0\"," >> $theme_path
  echo "        \"color1\": \"#$color1\"," >> $theme_path
  echo "        \"color2\": \"#$color2\"," >> $theme_path
  echo "        \"color3\": \"#$color3\"," >> $theme_path
  echo "        \"color4\": \"#$color4\"," >> $theme_path
  echo "        \"color5\": \"#$color5\"," >> $theme_path
  echo "        \"color6\": \"#$color6\"," >> $theme_path
  echo "        \"color7\": \"#$color7\"," >> $theme_path
  echo "        \"color8\": \"#$color8\"," >> $theme_path
  echo "        \"color9\": \"#$color9\"," >> $theme_path
  echo "        \"color10\": \"#$color10\"," >> $theme_path
  echo "        \"color11\": \"#$color11\"," >> $theme_path
  echo "        \"color12\": \"#$color12\"," >> $theme_path
  echo "        \"color13\": \"#$color13\"," >> $theme_path
  echo "        \"color14\": \"#$color14\"," >> $theme_path
  echo "        \"color15\": \"#$color15\"" >> $theme_path
  echo "    }," >> $theme_path
  echo "    \"checksum\": \"None\"" >> $theme_path
  echo "}" >> $theme_path
}

myou() {
  if [ -z "$1" ]; then
    echo "Empty list of options" >&2
    exit 1
  fi

  light=false
  image=""

  while getopts ":li:" option; do
    case $option in
      l)
        light=true
        ;;
      i)
        image=$OPTARG
        ;;
      \?)
        echo "Invalid option: -${OPTARG}" >&2
        exit 1
        ;;
    esac
  done
  # set wallpaper and restart dock
  /usr/libexec/PlistBuddy -c "set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$image" ~/Library/Application\ Support/com.apple.wallpaper/Store/Index.plist
  pkill -f WallpaperAgent &

  # generate main color
  colors=("${(@s: :)$(colorz -n 1 --maxv 250 "$image" --no-preview)}")
  generate_colors ${colors[1]} "$light"
  generate_pywal_theme "$image" "$light"

  # run pywal
  wal -n -s --theme "$HOME/.config/wal/colorschemes/dark/myou.json"

  # set macos and pywalfox mode
  if [ $light = true ]; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false'
    python3 -m pywalfox light
  else
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
    python3 -m pywalfox dark
  fi

  # reload apps
  sketchybar --reload &
  walogram -i "$image" &
  source "$HOME/.config/borders/bordersrc" &
  python3 -m pywalfox update &
  # set fastfetch logo
  magick "$image" -gravity Center -extent 1:1 "$HOME/.config/fastfetch/logo.png" &
  # copy wallpaper to zen profile
  cp "$image" "$(find "$HOME/Library/Application Support/zen/Profiles" -type d -name "*alpha*" | head -n 1)/chrome/img/wallpaper.jpg"
  wait
}
