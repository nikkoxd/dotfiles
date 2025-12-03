#!/bin/bash

update_cpu() {
    sketchybar --set "$NAME" icon="􀧓" label="$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5"%" }')"
}

update_ram() {
    sketchybar --set "$NAME" icon="􀧖" label="$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')%"
}

update_disk() {
    sketchybar --set "$NAME" icon="􀤃" label="$(df -H | grep -E '^(/dev/disk3s5).' | awk '{ printf ("%s\n", $5) }')"
}

update_network() {
    if [[ "$1" == "up" ]]; then
        INTERFACE="en0"

        bytes_in_1=$(netstat -i -b | grep "$INTERFACE" | head -1 | awk '{print $7}')
        bytes_in_2=$(netstat -i -b | grep "$INTERFACE" | head -1 | awk '{print $7}')

        in_speed=$((bytes_in_2 - bytes_in_1))

        sketchybar --set "$NAME" \
            label="$in_speed KB/s"
    elif [[ "$1" == "down" ]]; then
        INTERFACE="en0"

        bytes_out_1=$(netstat -i -b | grep "$INTERFACE" | head -1 | awk '{print $10}')
        bytes_out_2=$(netstat -i -b | grep "$INTERFACE" | head -1 | awk '{print $10}')

        out_speed=$((bytes_out_2 - bytes_out_1))

        sketchybar --set "$NAME" \
            label="$out_speed KB/s"
    else
        IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
        IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

        if [[ $IS_VPN != "" ]]; then
            ICON=􁅏
            LABEL="VPN"
        elif [[ $IP_ADDRESS != "" ]]; then
            ICON=􀤆
            LABEL=$IP_ADDRESS
        else
            ICON=􁣡
            LABEL="Offline"
        fi

        sketchybar --set "$NAME" \
            icon=$ICON \
            label="$LABEL"
    fi
}

case "$SENDER" in
"wifi_change")
    if [[ "$1" == "network" ]]; then
        update_network "$2"
    fi
    ;;
"mouse.clicked")
    case "$1" in
    "cpu")
        sketchybar --set "$NAME" script="$HOME/.config/sketchybar/plugins/stats.sh ram"
        update_ram
        ;;
    "ram")
        sketchybar --set "$NAME" script="$HOME/.config/sketchybar/plugins/stats.sh disk"
        update_disk
        ;;
    "disk")
        sketchybar --set "$NAME" script="$HOME/.config/sketchybar/plugins/stats.sh network"
        update_network "$2"
        ;;
    "network")
        sketchybar --set "$NAME" script="$HOME/.config/sketchybar/plugins/stats.sh cpu"
        update_cpu
        ;;
    esac
    ;;
*)
    case "$1" in
    "cpu")
        update_cpu
        ;;
    "ram")
        update_ram
        ;;
    "disk")
        update_disk
        ;;
    "network")
        update_network "$2"
        ;;
    esac
    ;;
esac
