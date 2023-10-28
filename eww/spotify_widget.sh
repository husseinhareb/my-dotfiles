#!/bin/bash

## Files and CMD
FILE="$HOME/.cache/eww_launch.spotify"
CFG="$HOME/.config/eww/spotify/"
EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi