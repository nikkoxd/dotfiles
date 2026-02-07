label=(
    icon="􁁒"
    label="Author - Title"
    script="$HOME/.config/sketchybar/plugins/apple_music.sh"
)

sketchybar --add item apple_music center \
           --set apple_music "${label[@]}" \
           --add event AppleMusicTrackChanged "com.apple.Music.playerInfo" \
           --subscribe apple_music AppleMusicTrackChanged mouse.scrolled
