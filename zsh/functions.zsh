function mkcd() { 
  mkdir $1
  cd $1
}

function fwal() {
  local imagePath="$(pwd)/$1"
  if [[ $2 == "light" ]]; then
    wal -l -n -s -i "$1" --cols16 darken
  else
    wal -n -s -i "$1" --cols16 lighten
  fi

  # set wallpaper and restart dock
  /usr/libexec/PlistBuddy -c "set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$imagePath" ~/Library/Application\ Support/com.apple.wallpaper/Store/Index.plist
  killall WallpaperAgent

  # reload apps
  if which walogram 2> /dev/null; then
    walogram
  fi
  sketchybar --reload
  brew services restart borders
}

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
