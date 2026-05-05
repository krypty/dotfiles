#!/bin/sh

killall waybar; waybar

# for i in 1 2 3 4 5 6 7 8 9 10; do
#     swaymsg "workspace $i; move workspace to output eDP-1"
# done

swaybg -o eDP-1 -i ~/Pictures/1037-1920x1200.jpg -m fill &
