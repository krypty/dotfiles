# Path to your oh-my-zsh installation.
export ZSH=/home/gary/.oh-my-zsh

# set a custom directory for the plugins/themes in order to use stow
ZSH_CUSTOM=$HOME/.zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau-gary"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git dirhistory pip extract colored-man-pages z mvn virtualenvwrapper vi-mode)

# User configuration

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/hadoop/bin"
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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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

## HADOOP
# Set Hadoop-related environment variables
export HADOOP_HOME=/usr/local/hadoop

# Add Hadoop bin/ directory to PATH
export PATH=$PATH:$HADOOP_HOME/bin

# Force GTK theme for Qt based applications
export QT_QPA_PLATFORMTHEME=qt5ct

export EDITOR=vim

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias pls='sudo $(fc -ln -1)'
alias git='LANG=en_US.utf-8 git'
alias ll='ls -al'
alias vimrc="vim ~/.vimrc"
alias xopen="xdg-open"
alias Q='exit'
alias rm='rm -i'
alias mv='mv -i'
alias :q="exit"
alias run-jupyter="bash ~/run-jupyter.sh"

# tmux aliases
alias ts="tmux new -s"
alias ta="tmux a -t"

# youtube-dl aliases
alias youtube-dl-playlist="youtube-dl --all-subs -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "
alias youtube-dl-mp3="youtube-dl -t -x --audio-format mp3 --audio-quality 0 "
alias youtube-dl-playlist-mp3="youtube-dl-playlist -x --audio-format=mp3 --audio-quality=0 "

# git aliases
alias gd="git icdiff"

# Android SDK, adb and tools
PATH=$PATH:/home/gary/Android/Sdk/platform-tools
PATH=$PATH:/home/gary/workspace/xu3/buildroot/output/host/usr/bin

# Virtualenv Python
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# anaconda
export PATH=/home/gary/anaconda3/bin:$PATH

# less utf-8
export LESSCHARSET=UTF-8

# show screen session in prompt
if [ -n "$STY" ]; then export PS1="(screen) $PS1"; fi
