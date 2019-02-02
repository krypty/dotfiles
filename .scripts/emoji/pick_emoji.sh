#!/usr/bin/env bash

# Stolen from https://github.com/LukeSmithxyz/voidrice/blob/458bb4b59b0cea24ff5a03752ea88a6213872262/.scripts/i3cmds/dmenuunicode
# Give dmenu list of all unicode characters to copy.
# Shows the selected character in dunst if running.

# Must have xclip installed to even show menu.
xclip -h >/dev/null || notify-send "[pick_emoji] xclip not found"

scriptdir=`dirname "$BASH_SOURCE"`
chosen=$(grep -v "#" $scriptdir/emoji | rofi -dmenu)

[ "$chosen" != "" ] || exit

c=$(echo "$chosen" | sed "s/ .*//")
echo "$c" | tr -d '\n' | xclip -selection clipboard
notify-send "'$c' copied to clipboard." &
