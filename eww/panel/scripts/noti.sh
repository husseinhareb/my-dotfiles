#!/bin/bash

status=$(dunstctl is-paused)

if [ "$1" == "--status" ]; then
    if [ "$status" == "true" ]; then
        echo "On"
    else
        echo "Off"
    fi
elif [ "$1" == "--toggle" ]; then
    if [ "$status" == "true" ]; then
        dunstctl set-paused false
    else
        dunstctl set-paused true
    fi
fi
