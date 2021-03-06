# to use in your .bashrc add: cd ~/.rc_files; source entrypoint.sh; cd -
#
# INPUT
#
source input/bash_input.sh

#
# PROMPT
#
source prompt/bash.sh


#
# ALIASES
#
for a in aliases/*
do
    source $a
done

#
# MAN
#
source man/colored_man_pages.sh

#
# HOOKS
#
source chpwd/hooks.sh

#
# DEFAULT aka too lazy to sort
#
source default.sh

# Start with tmux
[ -z "$TMUX"  ] && exec tmux new-session -c $HOME && exit;
