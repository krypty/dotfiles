# Better menu complete
if [ "$TERM" = xterm ]; then TERM=xterm-256color; fi
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Disable terminal freeze after pressing ctrl+s
stty -ixon

export EDITOR=vim

export PAGER=less
export LESSCHARSET=UTF-8

