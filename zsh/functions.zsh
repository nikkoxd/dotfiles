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
  if [ $light = true ]; then
    wal -l -n -s -i "$image" --cols16 darken
  else
    wal -n -s -i "$image" --cols16 lighten
  fi

  # set wallpaper and restart dock
  /usr/libexec/PlistBuddy -c "set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$image" ~/Library/Application\ Support/com.apple.wallpaper/Store/Index.plist
  killall WallpaperAgent

  # reload apps
  sketchybar --reload
  brew services restart borders
  $($HOME/.config/spicetify/Themes/Comfy/update-colors.sh)
  if which walogram 2> /dev/null; then
    walogram
  fi
}

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
