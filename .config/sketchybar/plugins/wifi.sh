#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

# When switching between devices, it's possible to get hit with multiple
# concurrent events, some of which may occur before `scutil` picks up the
# changes, resulting in race conditions.
sleep 1

NET_WIFI=􀙇         # Wi-Fi connected
NET_HOTSPOT=􀉤      # iPhone Wi-Fi hotspot connected
NET_USB=􀟜          # iPhone USB hotspot connected
NET_THUNDERBOLT=􀒗  # Thunderbolt bridge connected
NET_DISCONNECTED=􀙇 # Network disconnected, but Wi-Fi turned on
NET_OFF=􀙈          # Network disconnected, Wi-Fi turned off

services=$(networksetup -listnetworkserviceorder)
devices=$(scutil --nwi | sed -n "s/.*Network interfaces: \([^,]*\).*/\1/p")

service=""
service_index=100000
IFS=$' ' read -ra device_array <<< "$devices"
for device in "${device_array[@]}"; do
  # find the service for this device
  temp_service=$(echo "$services" | sed -n "s/.*Hardware Port: \([^,]*\), Device: $device.*/\1/p")
  # find the string after that service in the list
  rest=${services#*"$temp_service"}
  # get the char index of the service in the list (which can be used as a priority order)
  temp_service_index=$(( ${#services} - ${#rest} - ${#temp_service} ))
  # if service was found and is higher priority than current service
  if [ -n "$temp_service" ] && [ $temp_service_index -lt $service_index ]; then
    service=$temp_service
    service_index=$temp_service_index
  fi
done

color=$primary
case $service in
  "iPhone USB")         icon=$NET_USB;;
  "Thunderbolt Bridge") icon=$NET_THUNDERBOLT;;

  Wi-Fi)
    ssid=$(networksetup -listpreferredwirelessnetworks en0 | sed -n '2 p' | tr -d '\t')
    case $ssid in
      *iPhone*) icon=$NET_HOTSPOT;;
      "")       icon=$NET_DISCONNECTED; color=$on_surface_variant;;
      *)        icon=$NET_WIFI;;
    esac;;

  *)
    wifi_device=$(echo "$services" \
      | sed -n "s/.*Hardware Port: Wi-Fi, Device: \([^\)]*\).*/\1/p")
    test -n "$wifi_device" && status=$( \
      networksetup -getairportpower "$wifi_device" | awk '{print $NF}')
    icon=$(test "$status" = On && echo "$NET_DISCONNECTED" || echo "$NET_OFF")
esac

sketchybar --animate sin 5 --set "$NAME" icon="$icon" icon.color="$color"
