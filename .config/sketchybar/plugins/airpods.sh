#!/usr/bin/env bash

show_both_earbuds() {
    update

    sketchybar --animate sin 15 --set "$NAME" label="(􀲎 $left 􀲍 $right 􀹬 $case)"
}

update() {
    DEVICES="$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -rc '.SPBluetoothDataType[0].device_connected[] | select ( .[] | .device_minorType == "Headphones")' | jq '.[]')"
    if [ "$DEVICES" = "" ]; then
        sketchybar -m --set "$NAME" drawing=off
    else
        sketchybar -m --set "$NAME" drawing=on
        left="$(echo "$DEVICES" | jq -r .device_batteryLevelLeft | tr -d '[:space:]')"
        right="$(echo "$DEVICES" | jq -r .device_batteryLevelRight | tr -d '[:space:]')"
        case="$(echo "$DEVICES" | jq -r .device_batteryLevelCase | tr -d '[:space:]')"
        icon="􀪷"

        if [[ "$( echo "$left" | tr -d '[:space:]%')" -gt "$( echo "$right" | tr -d '[:space:]%')" ]]; then
            percentage="$right"
        else
            percentage="$left"
        fi

        if [[ "$left" == "null" ]]; then
            left="-"
            percentage="$right"
            icon="􀲍"
        fi

        if [[ "$right" == "null" ]]; then
            right="-"
            percentage="$left"
            icon="􀲎"
        fi

        if [[ "$case" == "null" ]]; then
            case="-"
        fi

        sketchybar --animate sin 15 --set "$NAME" icon="$icon" label="$percentage" updates=off
    fi
}

case "$SENDER" in
mouse.entered)
    show_both_earbuds
    ;;
mouse.exited)
    sketchybar --set "$NAME" updates=on
    update
    ;;
*)
    update
    ;;
esac
