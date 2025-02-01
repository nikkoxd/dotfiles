source "colors.sh"

if [[ $(launchctl list | grep -i spoof-dpi) ]]; then
  sketchybar --set "$NAME" icon=􀎠 icon.color=$DISABLED
  launchctl remove dev.nikko.spoof-dpi
else
  sketchybar --set "$NAME" icon=􀎤 icon.color=$ACCENT
  launchctl load $HOME/.config/sketchybar/helpers/spoof-dpi.plist
fi

