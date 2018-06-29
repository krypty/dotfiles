#!/usr/bin/env bash
/home/gary/Dropbox/borg/borg_backup_script.sh 2>&1 | p3mail "[Borg] backup for `date +'%F %T'`"
