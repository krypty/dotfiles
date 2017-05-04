#!/bin/sh
SERVICE='/usr/bin/xfce4-terminal'

if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
  wmctrl -xa Terminal
else
  $SERVICE
fi
