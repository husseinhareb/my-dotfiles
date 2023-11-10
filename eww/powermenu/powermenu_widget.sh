#!/bin/bash

## Files and CMD
FILE="$HOME/.cache/eww_launch.powermenu"
CFG="$HOME/.config/eww/powermenu/"
EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} --config "$CFG" open powermenu
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} --config "$CFG" close  powermenu
	rm "$FILE"
fi
