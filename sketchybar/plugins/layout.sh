#!/bin/bash

LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed 's/.* = \(.*\);/\1/')

sketchybar --set "$NAME" label="$LAYOUT"

