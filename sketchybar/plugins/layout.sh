#!/bin/bash

LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed 's/.* = \(.*\);/\1/')

case "$LAYOUT" in
  "Russian") LAYOUT="RU"
esac

sketchybar --set "$NAME" label="$LAYOUT"

