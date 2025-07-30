#/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if which starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
    starship_precmd  # required with wezterm
fi

cd /home/gary/.rc_files; source entrypoint.sh; cd - > /dev/null
