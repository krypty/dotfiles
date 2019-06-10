#
# CHPWD-LIKE FEATURE
# source: https://github.com/mpapis/bash_zsh_support/tree/master/chpwd
#
source ~/.rc_files/chpwd/function.sh
source ~/.rc_files/chpwd/load.sh

# define hooks as an shell array
export -a chpwd_functions

#
# HOOKS DEFINITIONS
#
run_source_me() {
  if [[ -x .sourceme ]]
  then
    source .sourceme
  fi
}

 [[ " ${chpwd_functions[*]} " == *" run_source_me "* ]] ||    # prevent double addition
 chpwd_functions+=(run_source_me)                          # finally add it to the list
