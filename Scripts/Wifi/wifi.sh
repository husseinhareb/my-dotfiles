#!/bin/bash
printf '%s\nTIME (s)\tSIGNAL STRENGTH (dBm)\tBITRATE (MBit/s)\n' "$(date --iso-8601=seconds)" >>log
for ((i=0; i<=60; i=i+5)); do
    iw dev wlp0s20f3 station dump | awk -vt=$i '$1=="signal:"{s=$2} $2=="bitrate:"{b=$3} END {printf "%d\t%d\t%.1f\n", t, s, b}' >>log
    sleep 5
done
