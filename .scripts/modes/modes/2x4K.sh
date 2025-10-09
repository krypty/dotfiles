#!/usr/bin/env bash

first_arg=$1

cdir=$(dirname $0)

# xrandr --output HDMI-0 --mode 3840x2160 --pos 0x0 --scale 0.75x0.75 --panning 2880x1620+0+0 --output DP-0 --mode 3840x2160 --pos 2880x0 --scale 0.75x0.75 --panning 2880x1620+2880+0

if [[ "$first_arg" != "--no-restart" ]]; then
    i3-msg restart
    sleep 3
fi

# feh --bg-scale /home/gary/dotfiles/scripts/modes/modes/34inches/wallpaper

# feh --bg-scale --no-xinerama $cdir/34inches/wallpaper
notify-send "Mode set to 2x4K"
