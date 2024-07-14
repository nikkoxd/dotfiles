#!/bin/bash

WEATHER=$(curl -s https://wttr.in/Izhevsk?format=%C)
TEMPERATURE=$(curl -s https://wttr.in/Izhevsk?format=%t)

if [[ "$WEATHER" != *"Unknown"* ]]; then
  case "$WEATHER" in
    "Clear ")
      ICON="􀆬"
      ;;
    "Sunny")
      ICON="􀆮"
      ;;
    "Partly cloudy ")
      ICON="􀇕"
      ;;
    "Cloudy" | "Overcast")
      ICON="􀇃"
      ;;
    "Mist" | "Fog" | "Freezing fog")
      ICON="􀇋"
      ;;
    "Patchy rain possible" | "Patchy light drizzle" | "Light drizzle" | "Freezing drizzle" | "Heavy freezing drizzle" | "Patchy light rain" | "Light rain" | "Light freezing rain" | "Light rain shower")
      ICON="􀇅"
      ;;
    "Patchy snow possible" | "Patchy freezing drizzle possible" | "Patchy light snow" | "Light snow" | "Patchy moderate snow" | "Moderate snow" | "Patchy heavy snow" | "Heavy snow" | "Ice pellets" | "Light snow shower" | "Moderate or heavy snow showers")
      ICON="􀇏"
      ;;
    "Patchy sleet possible" | "Light sleet" | "Moderate or heavy sleet" | "Light sleet showers" | "Moderate or heavy sleet showers")
      ICON="􀇑"
      ;;
    "Thundery outbreaks possible" | "Patchy light rain with thunder" | "Moderate or heavy rain with thunder")
      ICON="􀇟"
      ;;
    "Blowing snow" | "Blizzard")
      ICON="􀇦"
      ;;
    "Moderate rain at times" | "Moderate rain" | "Heavy rain at times" | "Heavy rain" | "Moderate or heavy rain showers" | "Moderate or heavy freezing rain")
      ICON="􀇉"
      ;;
    "Patchy light snow with thunder" | "Moderate or heavy snow with thunder")
      ICON="􀇓"
      ;;
    "Torrential rain showers")
      ICON="􀇉"
      ;;
    *)
      ICON=""
      ;;
  esac
  sketchybar --set "$NAME" icon="$ICON" label="$TEMPERATURE"
else
  sketchybar --set "$NAME" drawing=off
fi

