alias git='LANG=en_US.utf-8 git'
alias gpf="git pull --ff-only"
alias gpr="git pull --rebase"
alias g=git
alias gst="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias lg="lazygit"
alias gg="gitg"
# alias gco="git checkout"
alias gco="git branch -a | sed -E 's|remotes/[a-zA-Z]+/||' | sed 's|^[* ]*||' | sed '/->/d' | sort | uniq | fzf | xargs git checkout"
