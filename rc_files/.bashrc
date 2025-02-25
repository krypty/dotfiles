#/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

cd /home/gary/.rc_files; source entrypoint.sh; cd - > /dev/null
