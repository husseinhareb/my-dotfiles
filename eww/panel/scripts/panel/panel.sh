#!/bin/bash

if [ "$1" == "--brightness" ]; then
  # Get the current brightness level (using xrandr)
  max_brightness=$(cat /sys/class/backlight/*/max_brightness)
  current_brightness=$(cat /sys/class/backlight/*/brightness)
  brightness_percent=$((current_brightness * 100 / max_brightness))

  # Define brightness icons
  dim_icon="󰃟"
  low_icon="󰃝"
  medium_icon="󰃟"
  high_icon="󰃠"

  # Check brightness level and choose the appropriate icon
  if [ $brightness_percent -eq 10 ]; then
    icon=$dim_icon
  elif [ $brightness_percent -lt 40 ]; then
    icon=$low_icon
  elif [ $brightness_percent -lt 70 ]; then
    icon=$medium_icon
  else
    icon=$high_icon
  fi

  # Display the brightness icon and level
  echo "$icon $brightness_percent%"
fi


if [ "$1" == "--volume" ]; then
  # Get the current volume level
  volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}' | sed 's/%//')

  # Define volume icons
  mute_icon="󰖁"
  low_icon="󰕿"
  medium_icon="󰖀"
  high_icon="󰕾"

  # Check if the speaker is muted
  if [ $volume -eq 0 ]; then
    icon=$mute_icon
  elif [ $volume -lt 30 ]; then
    icon=$low_icon
  elif [ $volume -lt 70 ]; then
    icon=$medium_icon
  else
    icon=$high_icon
  fi

  # Display the volume icon and level
  echo "$icon $volume%"
fi
