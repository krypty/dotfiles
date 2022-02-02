#!/usr/bin/env bash

first_arg=$1

cdir=$(dirname $0)

xrandr --output eDP-1 --mode 1920x1080

if [[ "$first_arg" != "--no-restart" ]]; then
        i3-msg restart
        sleep 3
fi
# feh --bg-scale /home/gary/dotfiles/scripts/modes/modes/34inches/wallpaper
feh --bg-scale $cdir/thinkpad/wallpaper
notify-send "Mode set to thinkpad"
