#!/usr/bin/env bash
set -euo pipefail

brightness_increment="$1"
brightnessctl set "$brightness_increment"
current_brightness="$(brightnessctl info | perl -nE 'if (/\(([0-9]+)%\)/) { say $1 }')"
notify-send -h int:value:"$current_brightness" -h string:synchronous:brightness "Brightness"
