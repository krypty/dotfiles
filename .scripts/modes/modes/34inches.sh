#!/usr/bin/env bash

cdir=$(dirname $0)

xrandr --output DP-0 --mode 3440x1440 -r 100
i3-msg restart
sleep 3
# feh --bg-scale /home/gary/dotfiles/scripts/modes/modes/34inches/wallpaper
feh --bg-scale $cdir/34inches/wallpaper
notify-send "Mode set to 34inches"
