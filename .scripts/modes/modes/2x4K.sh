#!/usr/bin/env bash
set -euo pipefail

notify-send "Mode set to 2x4K"

first_arg=${1:-}

if [[ "$first_arg" != "--no-restart" ]]; then
    swaymsg reload
    sleep 3
fi

notify-send "Mode set to 2x4K. Done"
