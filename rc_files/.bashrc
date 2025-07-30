#/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"
starship_precmd  # required with wezterm

cd /home/gary/.rc_files; source entrypoint.sh; cd - > /dev/null
