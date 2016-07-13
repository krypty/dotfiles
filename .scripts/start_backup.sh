#!/usr/bin/bash

if [[ ! -f /tmp/.already_backup-up ]] && [[ "$(iwgetid | grep wifimaison)" != "" ]]; then
    deja-dup --backup
    touch /tmp/.already_backed-up
fi

