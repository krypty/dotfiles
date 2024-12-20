# regular colors
fgblack="\[\033[0;30m\]"    # black
fgred="\[\033[0;31m\]"    # red
fggreen="\[\033[0;32m\]"    # green
fgyellow="\[\033[0;33m\]"    # yellow
fgblue="\[\033[0;34m\]"    # blue
fgmagenta="\[\033[0;35m\]"    # magenta
fgcyan="\[\033[0;36m\]"    # cyan
fgwhite="\[\033[0;37m\]"    # white

bfgblack="\[\033[1;30m\]"    # black
bfgred="\[\033[1;31m\]"    # red
bfggreen="\[\033[1;32m\]"    # green
bfgyellow="\[\033[1;33m\]"    # yellow
bfgblue="\[\033[1;34m\]"    # blue
bfgmagenta="\[\033[1;35m\]"    # magenta
bfgcyan="\[\033[1;36m\]"    # cyan
bfgwhite="\[\033[1;37m\]"    # white

fgreset="\[\033[m\]"

p_cwd() {
  pwd | sed "s|/home/$USER|~|"
}

eval_virtual_env() {
  # Add python virtual env to prompt
  if [[ "$VIRTUAL_ENV" != "" ]]
      then
        # Strip out the path and just leave the env name
        echo "(${VIRTUAL_ENV##*/}) "
  else
        # In case you don't have one activated
        echo ""
  fi
}

source ~/.rc_files/prompt/git.sh

p_symbol="${fggreen}\$${fgreset}"

eval_jobs() {
  n_jobs=$(jobs -l | wc -l)
  if [[ $n_jobs -eq 0 ]]; then
    echo -n ""
    return
  fi
  echo -n "${fgcyan}[$n_jobs]${fgreset}"
}

prompt_cmd() {
if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  p_user="${bfgwhite}${USER}${fgreset}"
  p_host="${bfggreen}${HOSTNAME}${fgreset}"

  export PS1="🔌${p_user}@${p_host} ${bfgwhite}\$(p_cwd)${fgreset} \n$(eval_jobs)$(eval_virtual_env) $(parse_git_branch)${p_symbol} ${fgreset}"

else
  export PS1="🖥️${fgreset}$(eval_jobs)$(eval_virtual_env)$(parse_git_branch)$(p_cwd) ${p_symbol} ${fgreset}"
fi
}
PROMPT_COMMAND='prompt_cmd; history -a'

