# always be safe
unalias rm 2>/dev/null
real_rm=/bin/rm
rm_opts=""

function confirm {
  echo -n "Do you want to continue (Y/N)? "
  read v
  v=$(echo $v|tr '[a-z]' '[A-Z]')
  if [[ "$v" == "Y" ]]; then
    return 0
  elif [[ "$v" == "N" ]]; then
    return 1
  else
    confirm
  fi
}

function rm {
  if [ $# -eq 1 ]; then
    $real_rm $rm_opts -i $@
  elif [ $# -gt 2 ]; then
    echo "WARNING: You have passed a list of files and directories that is $# entries long!  Is this what you intended?"
    echo "Here is the list of files:"
    echo "$@"
    confirm
    if [ $? -eq 0 ]; then
      $real_rm $rm_opts $@
    fi
  else
    $real_rm $rm_opts $@
  fi
}
