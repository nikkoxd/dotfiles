#!/bin/bash

VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

if [[ $VPN != "" ]]; then
  sketchybar --set "$NAME" label=$VPN \
                           click_script='scutil --nc stop "Aeza"'
else
  sketchybar --set "$NAME" label="Off" \
                           click_script='scutil --nc start "Aeza"'
fi
