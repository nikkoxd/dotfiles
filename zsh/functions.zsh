function mkcd() { 
  mkdir $1
  cd $1
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
  killall WallpaperAgent

  args=()
  args+=("-n" "-s" "-i" "$image" "--backend" "$backend")
  if [ $light = true ]; then
    args+=("-l" "--cols16" "darken")
  else
    args+=("--cols16" "lighten")
  fi
  echo "Running wal ${args[@]}"
  wal "${args[@]}"

  # reload apps
  brew services restart borders
  sketchybar --reload
  if which walogram 2> /dev/null; then
    walogram
  fi

  # set fastfetch logo
  magick convert "$image" \
    -gravity Center \
    -extent 1:1 \
    "$HOME/.config/fastfetch/logo.png"
}

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
