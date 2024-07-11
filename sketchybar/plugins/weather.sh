#!/bin/bash

WEATHER=$(curl -s https://wttr.in/Izhevsk?format=%C)
TEMPERATURE=$(curl -s https://wttr.in/Izhevsk?format=%t)

echo "'$WEATHER'"

if [ "$WEATHER" == "Clear " ]; then
    ICON="􀆬"
elif [ "$WEATHER" == "Sunny " ]; then
    ICON="􀆮"
elif [ "$WEATHER" == "Partly cloudy " ]; then
    ICON="􀇕"
elif [ "$WEATHER" == "Cloudy " ]; then
    ICON="􀇃"
elif [ "$WEATHER" == "Overcast " ]; then
    ICON="􀇃"
elif [ "$WEATHER" == "Mist " ]; then
    ICON="􀇋"
elif [ "$WEATHER" == "Patchy rain possible " ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Patchy snow possible " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Patchy sleet possible " ]; then
    ICON="􀇑"
elif [ "$WEATHER" == "Patchy freezing drizzle possible " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Thundery outbreaks possible " ]; then
    ICON="􀇟"
elif [ "$WEATHER" == "Blowing snow " ]; then
    ICON="􀇦"
elif [ "$WEATHER" == "Blizzard " ]; then
    ICON="􀇦"
elif [ "$WEATHER" == "Fog " ]; then
    ICON="􀇋"
elif [ "$WEATHER" == "Freezing fog " ]; then
    ICON="􀇋"
elif [ "$WEATHER" == "Patchy light drizzle " ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Light drizzle " ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Freezing drizzle " ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Heavy freezing drizzle " ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Patchy light rain " ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Light rain " ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Moderate rain at times " ]; then
    ICON="􀇉"
elif [ "$WEATHER" == "Moderate rain " ]; then
    ICON="􀇉"
elif [ "$WEATHER" == "Heavy rain at times " ]; then
    ICON="􀇉"
elif [ "$WEATHER" == "Heavy rain " ]; then
    ICON="􀇉"
elif [ "$WEATHER" == "Light freezing rain " ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Moderate or heavy freezing rain " ]; then
    ICON="􀇇"
elif [ "$WEATHER" == "Light sleet " ]; then
    ICON="􀇑"
elif [ "$WEATHER" == "Moderate or heavy sleet " ]; then
    ICON="􀇑"
elif [ "$WEATHER" == "Patchy light snow " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Light snow " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Patchy moderate snow " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Moderate snow " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Patchy heavy snow " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Heavy snow " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Ice pellets " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Light rain shower" ]; then
    ICON="􀇅"
elif [ "$WEATHER" == "Moderate or heavy rain showers " ]; then
    ICON="􀇇"
elif [ "$WEATHER" == "Torrential rain showers " ]; then
    ICON="􀇉"
elif [ "$WEATHER" == "Light sleet showers " ]; then
    ICON="􀇑"
elif [ "$WEATHER" == "Moderate or heavy sleet showers " ]; then
    ICON="􀇑"
elif [ "$WEATHER" == "Light snow shower " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Moderate or heavy snow showers " ]; then
    ICON="􀇏"
elif [ "$WEATHER" == "Patchy light rain with thunder " ]; then
    ICON="􀇟"
elif [ "$WEATHER" == "Moderate or heavy rain with thunder " ]; then
    ICON="􀇟"
elif [ "$WEATHER" == "Patchy light snow with thunder " ]; then
    ICON="􀇓"
elif [ "$WEATHER" == "Moderate or heavy snow with thunder " ]; then
    ICON="􀇓"
else
    ICON=""
fi

sketchybar --set "$NAME" icon="$ICON" label="$TEMPERATURE"
