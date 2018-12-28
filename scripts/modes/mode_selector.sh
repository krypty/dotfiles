#!/usr/bin/env bash

cdir=$(dirname $0)
mode=$(ls -1 $cdir/modes | grep -vE ".sh$" | rofi -dmenu)
if [ -z "$mode" ] ; then
        exit 0
fi

notify-send $mode
bash $cdir/modes/$mode.sh
