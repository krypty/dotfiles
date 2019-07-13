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
# p_cwd() {
#   # $(pwd | sed "s|/home/$USER|~|")
#   local bfgwhite="\033[1;37m"    # white
#   local reset='\e[0m'
#   echo -e "${bfgwhite}$(pwd | sed 's|/home/$USER|~|')${reset}"
# }
#
# p_git() {
#   local fggreen="\033[0;32m"    # green
#   local bfgwhite="\033[1;37m"    # white
#   local reset='\e[0m'
#   source ~/.rc_files/prompt/git.sh
#   parse_git_branch
# }

p_user="${bfgwhite}${USER}${fgreset}"
p_host="${bfggreen}${HOSTNAME}${fgreset}"

source ~/.rc_files/prompt/git.sh
# p_git="`parse_git_branch`"

# cwd=`pwd | sed "s|/home/$USER|~|"`
# p_cwd="${bfgwhite}${cwd}${fgreset}"

p_symbol="${fggreen}\$${fgreset}"
# echo -e "$p_user@$p_host $p_cwd\n$p_git > $p_symbol "


prompt_cmd() {
  export PS1="${p_user}@${p_host} ${bfgwhite}\$(p_cwd)${fgreset} \n$(parse_git_branch) $GARY > ${p_symbol} ${fgreset}"
}
PROMPT_COMMAND=prompt_cmd
# export PS1="${p_user}@${p_host} ${bfgwhite}\$(p_cwd)${reset} \n > ${p_symbol} ${reset}"

# export PS1="\$(ps1)"
# ps1



