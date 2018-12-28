#!/usr/bin/env bash

modes_folder="/home/gary/dotfiles/scripts/modes/modes"
mode=$(ls -1 $modes_folder | grep -vE ".sh$" | rofi -dmenu)
if [ -z "$mode" ] ; then
        exit 0
fi

notify-send $mode
bash modes/$mode.sh
