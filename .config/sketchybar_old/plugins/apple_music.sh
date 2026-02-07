update_label() {
    IS_RUNNING=$(osascript -e 'tell application "System Events" to (name of processes) contains "Music"')

    if [ "$IS_RUNNING" == "false" ]; then
        sketchybar --set "$NAME" drawing=off
        return
    fi

    PLAYER_STATE=$(osascript -e 'tell application "Music" to get player state')

    if [ "$PLAYER_STATE" == "playing" ]; then
        ARTIST=$(osascript -e 'tell application "Music" to get artist of current track')
        TITLE=$(osascript -e 'tell application "Music" to get name of current track')

        sketchybar --set "$NAME" drawing=on label="$ARTIST - $TITLE"

        COVER_FORMAT=$(osascript -e 'tell application "Music" to get format of first artwork of current track')
        COVER_RAW=$(osascript -e 'tell application "Music" to get raw data of first artwork of current track')

        if [ "$COVER_FORMAT" == "JPEG picture" ]; then
            echo "$COVER_RAW" | base64 -D >/tmp/cover.jpeg
            sketchybar --set "$NAME" background.image="/tmp/cover.jpeg"
        else
            echo "$COVER_RAW" | base64 -D >/tmp/cover.png
            sketchybar --set "$NAME" icon.background.image="/tmp/cover.png"
        fi
    else
        sketchybar --set "$NAME" drawing=off
    fi
}

handle_scroll() {
    SCROLL_DELTA=$(echo "$INFO" | jq -r '.delta')

    if [ "$SCROLL_DELTA" == "0" ]; then
        return
    elif [ "$SCROLL_DELTA" -ge "1" ]; then
        osascript -e 'tell application "Music" to next track'
        update_label
        return
    elif [ "$SCROLL_DELTA" -le "-1" ]; then
        osascript -e 'tell application "Music" to previous track'
        update_label
        return
    fi
}

case "$SENDER" in
mouse.scrolled)
    handle_scroll
    ;;
*)
    update_label
    ;;
esac
