#!/usr/bin/env bash
set -euo pipefail

notify-send "Mode set to thinkpad"

first_arg=${1:-}

if [[ "$first_arg" != "--no-restart" ]]; then
    swaymsg reload
    sleep 3
fi

notify-send "Mode set to thinkpad. Done"
