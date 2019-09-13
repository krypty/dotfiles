# make xz use all threads
n_proc_minus_one=`nproc`
let "n_proc_minus_one-=1"
export XZ_OPT="--threads=$n_proc_minus_one"

# source hostname-specific commands
if [ -f $HOME/dotfiles/.scripts/globals/`hostname`.sh ]; then
     source $HOME/dotfiles/.scripts/globals/`hostname`.sh
fi

function ff() {
     find $1 -type f -print0 | xargs -0 grep -I --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -E $2
}

function ztic() {
     sudo mkdir -p /media/gary/BCN-NETKEY
     sudo mount /dev/disk/by-label/BCN-NETKEY /media/gary/BCN-NETKEY -o rw,nosuid,nodev,relatime,uid=1000
     ./ZTIC/zticproxy -mount:/media/gary/BCN-NETKEY
     sudo umount /media/gary/BCN-NETKEY
}