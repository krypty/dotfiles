#/usr/bin/env bash

# exec 3>&1 4>&2
# trap 'exec 2>&4 1>&3' 0 1 2 3
# exec 1>/tmp/bashrc.log 2>&1

# # If not running interactively, don't do anything
# [[ $- != *i* ]] && return

cd /home/gary/.rc_files; source entrypoint.sh; cd - > /dev/null
