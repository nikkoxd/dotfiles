#!/bin/bash

borders blacklist="Simulator"

opts=(
  style=round
  width=6.0
  hidpi=off
  active_color=0xff{{colors.primary.default.hex_stripped}}
  inactive_color=0xff{{colors.surface.default.hex_stripped}}
)

borders "${opts[@]}"

