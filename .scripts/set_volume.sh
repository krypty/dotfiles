#!/usr/bin/env bash
set -euo pipefail

volume_increment="$1"

pactl set-sink-volume @DEFAULT_SINK@ "$volume_increment"
current_volume="$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"
notify-send -h int:value:"$current_volume" -h string:synchronous:volume "Volume"
