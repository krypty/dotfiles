# get current branch in git repo
parse_git_branch() {

  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    local -r MAX_CHARS_BRANCH_NAME=25
    if [ $(echo -n $BRANCH | wc -m) -gt $MAX_CHARS_BRANCH_NAME ]; then
      BRANCH=$(echo $BRANCH | sed -E "s/(.{,$MAX_CHARS_BRANCH_NAME})(.*)/\1.../")
    fi

    STAT=`parse_git_dirty`
    echo "[${bfggreen}±${fgreset}${BRANCH}${STAT}] "
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  diverged=`echo -n "${status}" 2> /dev/null | grep "different commits each" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="↑${bits}"
  fi
  if [ "${diverged}" == "0" ]; then
    bits="↑↓${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="${fggreen}●${fgreset}${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="${fgred}●${fgreset}${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="${fgyellow}●${fgreset}${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo " ✓"
  fi
}
