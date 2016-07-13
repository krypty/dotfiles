#!/usr/bin/bash
sleep 30
nohup onedrive-d start --debug &> /var/log/onedrive_d.log &
sleep 2
onedrive-d-systemtray
