#!/bin/sh
(polybar power)&
(polybar clock)&
(polybar spotify)&
(polybar panel)&
(polybar battery)&

dunst&
picom&
conky&
