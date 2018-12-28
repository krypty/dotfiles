#!/usr/bin/env bash

mons -s
i3-msg restart
sleep 3
feh --bg-scale /home/gary/dotfiles/scripts/modes/modes/34inches/wallpaper
notify-send "Mode set to 34inches"
