#!/usr/bin/env bash

# Put that script in /etc/pacman.d/hooks/ and make it executable
/usr/bin/paccache -vrk2
/usr/bin/paccache -vruk1
/usr/bin/paccache --cachedir /home/gary/.cache/pikaur/pkg/ -vrk2
/usr/bin/paccache --cachedir /home/gary/.cache/pikaur/pkg/ -vruk1
