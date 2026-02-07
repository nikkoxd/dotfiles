#!/bin/bash

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Telegram")
ICON=""
if [[ "$STATUS_LABEL" =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ "$LABEL" == "" ]]; then
        DRAWING="off"
    else
        DRAWING="on"
    fi
else
    exit 0
fi

sketchybar --set "$NAME" drawing="$DRAWING" icon="$ICON" label="$LABEL"
