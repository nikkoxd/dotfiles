#!/bin/bash

LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -Ew 'KeyboardLayout Name' | sed 's/.* = \(.*\);/\1/')
INPUT_MODE=$(/usr/libexec/PlistBuddy -c "Print AppleSelectedInputSources:1:Input\ Mode" ~/Library/Preferences/com.apple.HIToolbox.plist 2> /dev/null)

case "$LAYOUT" in
  "Russian") LAYOUT="РУ"
esac

case "$INPUT_MODE" in
  "com.apple.inputmethod.Japanese") LAYOUT="日本"
esac

sketchybar --set "$NAME" label="$LAYOUT"

