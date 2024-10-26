generate_tonal_palette() {
  lightness_values=(0 10 20 30 40 50 60 70 80 90 95 99 100)

  local color=$1
  local role_name=$2
  local chroma=$3
  local hue_rotation=$4

  for lightness in "${lightness_values[@]}"; do
    var_name="${role_name}_${lightness}"

    if [ -z "$hue_rotation" ]; then
      color=$(pastel set chroma "$chroma" "$color" | pastel set lightness "$lightness" | pastel format hex | sed 's/#//')
    else
      color=$(pastel rotate "$hue_rotation" "$color" | pastel set chroma "$chroma" | pastel set lightness "$lightness" | pastel format hex | sed 's/#//')
    fi

    echo "export $var_name=\"$color\"" >> "$HOME/.cache/wal/colors-materialyou.sh"
    echo "  --$var_name: #$color;" >> "$HOME/.cache/wal/colors-materialyou.css"
  done
}

assign_color_roles() {
  local color_roles=(
    ["primary"]="primary_80"
    ["on-primary"]="primary_20"
    ["primary-container"]="primary_30"
    ["on-primary-container"]="primary_90"

    ["secondary"]="secondary_80"
    ["on-secondary"]="secondary_20"
    ["secondary-container"]="secondary_30"
    ["on-secondary-container"]="secondary_90"

    ["tertiary"]="tertiary_80"
    ["on-tertiary"]="tertiary_20"
    ["tertiary-container"]="tertiary_30"
    ["on-tertiary-container"]="tertiary_90"

    ["error"]="error_80"
    ["on-error"]="error_20"
    ["error-container"]="error_30"
    ["on-error-container"]="error_90"

    ["surface-dim"]="neutral_10"
    ["surface"]="neutral_10"
    ["surface-bright"]="neutral_20"
    ["on-surface"]="neutral_90"
    ["on-surface-variant"]="neutral_variant_90"
    ["outline"]="neutral_variant_60"
    ["outline-variant"]="neutral_variant_30"

    ["inverse-surface"]="neutral_90"
    ["inverse-on-surface"]="neutral_20"
    ["inverse-primary"]="primary_40"

    ["scrim"]="neutral_0"
    ["shadow"]="neutral_0"
  )
  local light_color_roles=(
    ["primary"]="primary_40"
    ["on-primary"]="primary_100"
    ["primary-container"]="primary_90"
    ["on-primary-container"]="primary_10"

    ["secondary"]="secondary_40"
    ["on-secondary"]="secondary_100"
    ["secondary-container"]="secondary_90"
    ["on-secondary-container"]="secondary_10"

    ["tertiary"]="tertiary_40"
    ["on-tertiary"]="tertiary_100"
    ["tertiary-container"]="tertiary_90"
    ["on-tertiary-container"]="tertiary_10"

    ["error"]="error_40"
    ["on-error"]="error_100"
    ["error-container"]="error_90"
    ["on-error-container"]="error_10"

    ["surface-dim"]="neutral_90"
    ["surface"]="neutral_99"
    ["surface-bright"]="neutral_99"
    ["on-surface"]="neutral_10"
    ["on-surface-variant"]="neutral_variant_30"
    ["outline"]="neutral_variant_50"
    ["outline-variant"]="neutral_variant_80"

    ["inverse-surface"]="neutral_20"
    ["inverse-on-surface"]="neutral_95"
    ["inverse-primary"]="primary_80"

    ["scrim"]="neutral_0"
    ["shadow"]="neutral_0"
  )
  for role in "${(@k)color_roles}"; do
    color_variable="${color_roles[$role]}"

    echo "export ${role}=\$$color_variable" >> "$HOME/.cache/wal/colors-materialyou.sh"

    echo "  --${role}: var(--$color_variable);" >> "$HOME/.cache/wal/colors-materialyou.css"
  done
}

generate_colors() {
  color=$1

  : > "$HOME/.cache/wal/colors-materialyou.sh"
  echo ":root {" > "$HOME/.cache/wal/colors-materialyou.css"

  generate_tonal_palette $color "primary" 40
  generate_tonal_palette $color "secondary" 30
  generate_tonal_palette $color "tertiary" 45 60
  generate_tonal_palette $color "error" 80
  generate_tonal_palette $color "neutral" 4
  generate_tonal_palette $color "neutral_variant" 8

  echo "" >> "$HOME/.cache/wal/colors-materialyou.sh"
  echo "" >> "$HOME/.cache/wal/colors-materialyou.css"

  # assign_color_roles

  echo "}" >> "$HOME/.cache/wal/colors-materialyou.css"
}

generate_pywal_theme() {
  local image=$1
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

  while getopts ":l:i:" option; do
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
  generate_colors ${colors[1]} 
  generate_pywal_theme "$image"

  # run pywal
  wal -n -s --theme "$HOME/.config/wal/colorschemes/dark/myou.json"
  # reload apps
  sketchybar --reload &
  walogram &
  source "$HOME/.config/borders/bordersrc" &
  python3 -m pywalfox update &
  # set fastfetch logo
  magick "$image" -gravity Center -extent 1:1 "$HOME/.config/fastfetch/logo.png" &
  wait
}
