# source hostname-specific commands
if [ -f $HOME/dotfiles/.scripts/globals/`hostname`.sh ]; then
     source $HOME/dotfiles/.scripts/globals/`hostname`.sh
fi

# disable history expansion e.g. `sudo !!`
set +H

# Better bash history
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend  # append to history, don't overwrite it
export HISTCONTROL=ignoredups:erasedups
shopt -s cmdhist  # use one command per line

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git'"
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Make nnn preview escape colors correctly, also set insensitive search for less
export PAGER="less -Ri"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;d:diffs;t:nmount;v:imgview;p:preview-tui'
BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_OPTS="H"


export RIPGREP_CONFIG_PATH=~/.ripgreprc

_gen_fzf_default_opts

export PATH=/home/gary/.local/bin:$PATH
