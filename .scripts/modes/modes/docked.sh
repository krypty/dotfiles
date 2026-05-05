#!/bin/sh

killall waybar; waybar

# # Assign workspaces 1–5 to DP-3
# for i in 1 2 3 4 5; do
#     swaymsg "workspace $i; move workspace to output DP-3"
# done
#
# # Assign workspaces 6–10 to DP-4
# for i in 6 7 8 9 10; do
#     swaymsg "workspace $i; move workspace to output DP-4"
# done

swaybg -o DP-3 -i ~/Pictures/left.jpg -m fill &
swaybg -o DP-4 -i ~/Pictures/right.jpg -m fill &
