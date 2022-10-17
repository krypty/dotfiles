#!/usr/bin/env bash
first_arg=$1

xrandr --output DVI-D-0 --off --output HDMI-1-2 --off --output HDMI-1-1 --off --output DP-1-1 --off --output HDMI-0 --off --output DP-5 --off --output DP-4 --off --output DP-3 --off --output DP-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --mode 1920x1080 --pos 1920x0 --rotate normal

nitrogen --restore

if [[ "$first_arg" != "--no-restart" ]]; then
        i3-msg restart
fi
