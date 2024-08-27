#!/bin/bash

cp -r "$HOME/.cache/wal/colors-spicetify.ini" "$HOME/.config/spicetify/Themes/Comfy"
cd "$HOME/.config/spicetify/Themes/Comfy/" || return
mv colors-spicetify.ini color.ini
