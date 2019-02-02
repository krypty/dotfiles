# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set a custom directory for the plugins/themes in order to use stow
ZSH_CUSTOM=$HOME/.zsh_custom

ZSH_THEME="bureau-gary"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy/mm/dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pip colored-man-pages z vi-mode)

# User configuration

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/gary/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

## Vi Mode source: https://github.com/gotbletu/dotfiles/blob/master/zshrc/.zshrc
export KEYTIMEOUT=1 # kill the lag after pressing ESC

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
# map Home and End to move at the beginning and at the end of the line
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
bindkey -M vicmd "${terminfo[kend]}" end-of-line

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey -M viins '^k' vi-up-line-or-history
bindkey -M vicmd '^k' vi-up-line-or-history
bindkey -M viins '^j' vi-down-line-or-history
bindkey -M vicmd '^j' vi-down-line-or-history

# Fix the Delete key
bindkey -M vicmd "\e[3~" delete-char
bindkey -M viins "\e[3~" delete-char
bindkey -M menuselect "\e[3~" delete-char

# Disable terminal freeze after pressing ctrl+s
stty -ixon

# Force GTK theme for Qt based applications
# export QT_QPA_PLATFORMTHEME=qt5ct
set QT_QPA_PLATFORMTHEME=gtk2
unset QT_STYLE_OVERRIDE

export EDITOR=vim
export PAGER=less

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias reload-xresources="xrdb ~/.Xresources"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias pls='sudo $(fc -ln -1)'
alias git='LANG=en_US.utf-8 git'
alias ll='ls -al'
alias vimrc="vim ~/.vimrc"
alias xopen="gio open"
alias Q='exit'
alias mv='mv -i'
alias :q="exit"
alias run-jupyter="bash ~/run-jupyter.sh"
alias calc="loffice --calc"
alias jp="jupyter-notebook"
alias dots="cd ~/dotfiles"
alias fd="fd -H"
alias i3c="vim ~/.config/i3/config"
alias history="fc -li 100"
alias m="make"
alias rg="ranger"
alias v="vim"
alias py="python"
alias wtr="curl 'http://wttr.in/lausanne?lang=fr'"
alias pu="pikaur -Syu"

# tmux aliases
alias ts="tmux new -s"
alias ta="tmux a -t"

# youtube-dl aliases
alias youtube-dl-playlist="youtube-dl --all-subs -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "
alias youtube-dl-mp3="youtube-dl -o '%(title)s-%(id)s.%(ext)s' -x --audio-format mp3 --audio-quality 0"
alias youtube-dl-playlist-mp3="youtube-dl-playlist -x --audio-format=mp3 --audio-quality=0 "

# git aliases
alias gd="git difftool"
alias gds="git difftool --staged"
alias lg="lazygit"
alias gg="gitg"

# Android SDK, adb and tools
PATH=$PATH:/home/gary/Android/Sdk/platform-tools

# less utf-8
export LESSCHARSET=UTF-8

# show screen session in prompt
if [ -n "$STY" ]; then export PS1="(screen) $PS1"; fi

# setup dircolors
eval `dircolors ~/.dir_colors`

# make xz use all threads
n_proc_minus_one=`nproc`
let "n_proc_minus_one-=1"
export XZ_OPT="--threads=$n_proc_minus_one"

# source hostname-specific commands
if [ -f $HOME/dotfiles/.scripts/globals/`hostname`.sh ]; then
     source $HOME/dotfiles/.scripts/globals/`hostname`.sh
fi

# set extended glob
setopt extended_glob

# safe rm
source ~/dotfiles/zsh/safe_rm.sh

## Custom functions
function ff() {
     find $1 -type f -print0 | xargs -0 grep -I --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -E $2
}

function td() {
     bash -c "cd ~/tasks/ && vim *.md"
}

function ztic() {
     sudo mkdir -p /media/gary/BCN-NETKEY
     sudo mount /dev/disk/by-label/BCN-NETKEY /media/gary/BCN-NETKEY -o rw,nosuid,nodev,relatime,uid=1000
     ./ZTIC/zticproxy -mount:/media/gary/BCN-NETKEY
     sudo umount /media/gary/BCN-NETKEY
}

function most_recent_folders() {
     RED="\\\e[1;32m"
     NC="\\\e[0m"  # no color
     COLOR=$RED
     muf_file="/tmp/most_used_folders"
     sort -t\| -nk2 ~/.z | tail -n10 | sort | awk -F\| '{printf "[%s] %s (%s)\n", NR-1, $1, NR-1}' > $muf_file

     cp $muf_file $muf_file.bak
     sed -i "s/[0-9]/${COLOR}\0${NC}/" $muf_file.bak
     sed -i -r "s/(.*)\/(.+)/\1\/${COLOR}\2${NC}/" $muf_file.bak
     echo "$(cat $muf_file.bak)"

     echo ""
     read -k "ans?Choose [0-9]: "
     # chosen_folder=$(cat $muf_file | awk -v ans="$ans" '$1 ~ ans {print $2}')
     chosen_folder=$(cat $muf_file | fzf)
     echo ""
     cd $chosen_folder
}
# alias d=most_recent_folders

function seldir() {
        seldir=$(z | sort -rn | awk '{ print $2 }' | fzf); cd $seldir;
}
alias d=seldir


# pyenv
eval "$(pyenv init - --no-rehash)"
eval "$(pyenv virtualenv-init -)"

# zsh hooks
autoload -U add-zsh-hook

# source .sourceme file if exist on dir changed
function run-source-me() {
        if [[ -x .sourceme ]]; then
                source .sourceme
        fi
}
add-zsh-hook chpwd run-source-me
