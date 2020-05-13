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

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up'

# Base16 Gruvbox dark, hard
# Author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)

_gen_fzf_default_opts() {

local color00='#1d2021'
local color01='#3c3836'
local color02='#504945'
local color03='#665c54'
local color04='#bdae93'
local color05='#d5c4a1'
local color06='#ebdbb2'
local color07='#fbf1c7'
local color08='#fb4934'
local color09='#fe8019'
local color0A='#fabd2f'
local color0B='#b8bb26'
local color0C='#8ec07c'
local color0D='#83a598'
local color0E='#d3869b'
local color0F='#d65d0e'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts
