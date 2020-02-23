# source hostname-specific commands
if [ -f $HOME/dotfiles/.scripts/globals/`hostname`.sh ]; then
     source $HOME/dotfiles/.scripts/globals/`hostname`.sh
fi

function ztic() {
     sudo mkdir -p /media/gary/BCN-NETKEY
     sudo mount /dev/disk/by-label/BCN-NETKEY /media/gary/BCN-NETKEY -o rw,nosuid,nodev,relatime,uid=1000
     ./ZTIC/zticproxy -mount:/media/gary/BCN-NETKEY
     sudo umount /media/gary/BCN-NETKEY
}

# function shared_history {
#     export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
#     export HISTSIZE=100000                   # big big history
#     export HISTFILESIZE=100000               # big big history
#     shopt -s histappend                      # append to history, don't overwrite it
#
#     # Save and reload the history after each command finishes
#     export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# }
#
# shared_history

# function source_sourceme() {
#     if [ -x ".sourceme" ]; then
#         source .sourceme
#     fi
# }
#
# export PROMPT_COMMAND="$(source_sourceme)$PROMPT_COMMAND"

