function mkcd() { 
  mkdir $1
  cd $1
}

function generate_tonal_palette() {
  #  TODO: Use colorz or haishoku or similar backend instead of pywal here
  source "$HOME/.cache/wal/colors.sh"

  lightness_values=(0 10 20 30 40 50 60 70 80 90 95 99 100)

  local role_name=$1
  local chroma=$2
  local hue_rotation=$3

  for lightness in "${lightness_values[@]}"; do
    var_name="${role_name}_${lightness}"

    if [ -z "$hue_rotation" ]; then
      color=$(pastel set chroma "$chroma" "$color4" | pastel set lightness "$lightness" | pastel format hex | sed 's/#//')
    else
      color=$(pastel set chroma "$chroma" "$color4" | pastel rotate "$hue_rotation" | pastel set lightness "$lightness" | pastel format hex | sed 's/#//')
    fi

    echo "export $var_name=\"$color\"" >> "$HOME/.cache/wal/colors-materialyou.sh"
    echo "  --$var_name: #$color;" >> "$HOME/.cache/wal/colors-materialyou.css"
  done
}

function assign_color_roles() {
  declare -A color_roles=(
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

    ["primary-fixed"]="primary_90"
    ["primary-fixed-dim"]="primary_80"
    ["on-primary-fixed"]="primary_30"
    ["on-primary-fixed-variant"]="primary_10"

    ["secondary-fixed"]="secondary_90"
    ["secondary-fixed-dim"]="secondary_80"
    ["on-secondary-fixed"]="secondary_30"
    ["on-secondary-fixed-variant"]="secondary_10"

    ["tertiary-fixed"]="tertiary_90"
    ["tertiary-fixed-dim"]="tertiary_80"
    ["on-tertiary-fixed"]="tertiary_30"
    ["on-tertiary-fixed-variant"]="tertiary_10"

    ["surface-dim"]="neutral_90"
    ["surface"]="neutral_95"
    ["surface-bright"]="neutral_99"
    ["surface-container-lowest"]="neutral_100"
    ["surface-container-low"]="neutral_95"
    ["surface-container"]="neutral_90"
    ["surface-container-high"]="neutral_80"
    ["surface-container-highest"]="neutral_70"
    ["on-surface"]="neutral_10"
    ["on-surface-variant"]="neutral_variant_20"
    ["outline"]="neutral_50"
    ["outline-variant"]="neutral_variant_50"

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

function generate_wal_theme() {
  #  TODO: Generate a pywal theme from material colors 
  # ...
}

function wal_to_materialyou() {
  : > "$HOME/.cache/wal/colors-materialyou.sh"
  echo ":root {" > "$HOME/.cache/wal/colors-materialyou.css"

  generate_tonal_palette "primary" 48
  generate_tonal_palette "secondary" 16
  generate_tonal_palette "tertiary" 24 60
  generate_tonal_palette "neutral" 4
  generate_tonal_palette "neutral_variant" 8

  echo "" >> "$HOME/.cache/wal/colors-materialyou.sh"
  echo "" >> "$HOME/.cache/wal/colors-materialyou.css"

  assign_color_roles

  echo "}" >> "$HOME/.cache/wal/colors-materialyou.css"
}

function fwal() {
  if [ -z "$1" ]; then
    echo "Empty list of options" >&2
    exit 1
  fi

  light=false
  image=""
  backend="wal"

  while getopts ":lb:i:" option; do
    case $option in
      l)
        light=true
        ;;
      b)
        backend=$OPTARG
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

  args=()
  args+=("-n" "-s" "-i" "$image" "--backend" "$backend")
  if [ $light = true ]; then
    args+=("-l" "--cols16" "darken")
  else
    args+=("--cols16" "lighten")
  fi
  wal "${args[@]}"
  wal_to_materialyou

  # reload apps
  sketchybar --reload &
  walogram &
  source "$HOME/.config/borders/bordersrc" &
  # set fastfetch logo
  magick "$image" -gravity Center -extent 1:1 "$HOME/.config/fastfetch/logo.png" &

  wait
}

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
