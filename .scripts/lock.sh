#!/usr/bin/env bash

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst

if [[ -n "$WAYLAND_DISPLAY" ]]; then
    # swaylock \
    #     --screenshots \
    #     --clock \
    #     --indicator \
    #     --indicator-radius 100 \
    #     --indicator-thickness 7 \
    #     --effect-blur 7x5 \
    #     --effect-vignette 0.5:0.5 \
    #     --ring-color bb00cc \
    #     --key-hl-color 880033 \
    #     --line-color 00000000 \
    #     --inside-color 00000088 \
    #     --separator-color 00000000 \
    #     --grace 0 \
    #     --fade-in 0
    image=$(mktemp --suffix=.png)
    text="Locked"
    convert -size 1920x1080 xc:black -fill grey -font "DejaVu-Sans" -pointsize 128 -gravity center -annotate +0+300 "$text" "$image"
    swaylock --color 000000 --image "$image" --scaling center --indicator-idle-visible
else
    i3lock-fancy
fi
pkill -u $USER -USR2 dunst
