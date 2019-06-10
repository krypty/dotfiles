say() {
  echo "$@" | sed \
    -e "s/\(\(@\(red\|green\|yellow\|blue\|magenta\|cyan\|white\|reset\|b\|u\)\)\+\)[[]\{2\}\(.*\)[]]\{2\}/\1\4@reset/g" \
    -e "s/@red/$(tput setaf 1)/g" \
    -e "s/@green/$(tput setaf 2)/g" \
    -e "s/@yellow/$(tput setaf 3)/g" \
    -e "s/@blue/$(tput setaf 4)/g" \
    -e "s/@magenta/$(tput setaf 5)/g" \
    -e "s/@cyan/$(tput setaf 6)/g" \
    -e "s/@white/$(tput setaf 7)/g" \
    -e "s/@reset/$(tput sgr0)/g" \
    -e "s/@b/$(tput bold)/g" \
    -e "s/@u/$(tput sgr 0 1)/g"
  }

ps1() {
  p_user=`say @b@white[[$USER]]`
  p_host=`say @b@green[[$HOSTNAME]]`

  source ~/.rc_files/prompt/git.sh
  p_git="`parse_git_branch`"

  cwd=`pwd | sed "s|/home/$USER|~|"`
  p_cwd=`say @b@white[[$cwd]]`

  p_symbol=`say @green[[$]]`
  echo -e "$p_user@$p_host $p_cwd\n$p_git > $p_symbol "
}

export PS1="\$(ps1)"



