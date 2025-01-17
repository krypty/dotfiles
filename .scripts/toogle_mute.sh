#!/usr/bin/env bash
set -euo pipefail

muted="$(pactl get-sink-mute @DEFAULT_SINK@ | awk -F': ' '{ print $2 }')"

if [[ "$muted" == "yes" ]]; then
    notify-send -h string:synchronous:volume "🔇 Volume unmuted"
else
    notify-send -h string:synchronous:volume "🔊 Volume muted"
fi

pactl set-sink-mute @DEFAULT_SINK@ toggle # mute sound
