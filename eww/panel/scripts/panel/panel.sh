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

# Get mute status
mute_status=$(pactl list sinks | grep 'Mute:' | awk '{print $2}' | head -n 1)

# Define volume icons
mute_icon="󰖁"
low_icon="󰕿"
medium_icon="󰖀"
high_icon="󰕾"

# Check if the speaker is muted
if [ "$mute_status" = "yes" ]; then
    icon=$mute_icon
    echo "$icon muted"
else
    if [ $volume -eq 0 ]; then
        icon=$mute_icon
        echo "$icon $volume%"
    elif [ $volume -lt 30 ]; then
        icon=$low_icon
        echo "$icon $volume%"
    elif [ $volume -lt 70 ]; then
        icon=$medium_icon
        echo "$icon $volume%"
    else
        icon=$high_icon
        echo "$icon $volume%"
    fi
fi
fi

if [ "$1" == "--weather" ]; then
  python3 $HOME/.config/eww/panel/scripts/weather/weather.py
fi


if [ "$1" == "--mic" ]; then
  mic_source=$(pactl info | grep "Default Source:" | awk '{print $3}')

  if [ "$1" == "1" ]; then
    # Left mouse button clicked - toggle microphone mute status
    pactl set-source-mute "$mic_source" toggle
  fi

  # Get the microphone status (mute/unmute)
  mic_status=$(pactl list sources | awk -v mic_source="$mic_source" '/^Source/ {in_source=0} $0 ~ ("Name: " mic_source) {in_source=1} in_source && /Mute:/ {print $2}')

  mic_volume=$(pactl list sources | awk -v mic_source="$mic_source" '/^Source/ {in_source=0} $0 ~ ("Name: " mic_source) {in_source=1} in_source && /Volume:/ {print $5}')

  # Convert the volume to percentage
  mic_percentage=$(awk -v volume="$mic_volume" 'BEGIN {split(volume, a, "%"); print a[1]}')

  # Check the microphone status and set the output accordingly
  if [ "$mic_status" == "yes" ]; then
    echo " Muted"
  else
    echo " $mic_percentage%"
  fi
fi
