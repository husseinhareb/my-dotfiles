#!/bin/bash

## Files and CMD
FILE="$HOME/.cache/eww_launch.panel"
CFG="$HOME/.config/eww/panel/"
EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} --config "$CFG" open-many  resources system notification screenshot volume brightness mic weather
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} --config "$CFG" close  resources system notification screenshot volume brightness mic weather
	rm "$FILE"
fi
