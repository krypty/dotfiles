#!/usr/bin/env bash

cdir=$(dirname $0)

pushd $cdir/modes
mode=$(ls -1 *.sh | awk -F .sh '{ print $1  }' | rofi -dmenu)
popd

if [ -z "$mode" ] ; then
        exit 0
fi

notify-send $mode
bash $cdir/modes/$mode.sh
