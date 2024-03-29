# Better menu complete
if [ "$TERM" = xterm ]; then TERM=xterm-256color; fi
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'
bind 'set menu-complete-display-prefix on'
bind '"\t": menu-complete'
bind '"\e[Z": menu-complete-backward'
bind '"\C-h": backward-kill-word'
bind '"^[[1;3D": backward-word'
bind '"^[[1;3C": forward-word'
bind '"\ej": next-history'
bind '"\ek": previous-history'
bind '"\ee": edit-and-execute-command'

# Disable terminal freeze after pressing ctrl+s
stty -ixon

export EDITOR=nvim

export PAGER=less
export LESSCHARSET=UTF-8

