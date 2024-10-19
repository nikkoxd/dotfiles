function mkcd() { 
  mkdir $1
  cd $1
}

function generate_tonal_palette() {
  source "$HOME/.cache/wal/colors.sh"

  lightness_values=(0 10 20 40 60 80 100)

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
  done
}

function wal_to_materialyou() {
  : > "$HOME/.cache/wal/colors-materialyou.sh"

  generate_tonal_palette "primary" 48
  generate_tonal_palette "secondary" 16
  generate_tonal_palette "tertiary" 24 60
  generate_tonal_palette "neutral" 4
  generate_tonal_palette "neutral_variant" 8
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
