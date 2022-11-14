# ensure anacron dirs and files exists, even if empty
mkdir -p ${HOME}/.anacron/{etc,spool}
touch ${HOME}/.anacron/etc/anacrontab
anacron -s -t ${HOME}/.anacron/etc/anacrontab -S ${HOME}/.anacron/spool

[[ $(hostname) == "erxpc33" ]] && export PRIMARY_MON=DP-0
[[ $(hostname) == "erxpc33" ]] && export WINIT_X11_SCALE_FACTOR='1.1'
[[ $(hostname) == "erxpc33" ]] && export PRIMARY_IFACE='enp3s0'

[[ $(hostname) == "thinkpad-archlinux" ]] && export PRIMARY_MON=eDP-1
[[ $(hostname) == "thinkpad-archlinux" ]] && export WINIT_X11_SCALE_FACTOR='1.4'

[[ $(hostname) == "tower" ]] && export PRIMARY_MON=DP-0

[[ $(hostname) == "archlinux-hp" ]] && export WINIT_X11_SCALE_FACTOR='1.2'

# Disable caps lock
setxkbmap -option caps:none
# Map Control_Right to (context) Menu
xmodmap -e "keycode 105 = Menu"
# Disable middle click on touchpad
xinput --list | grep "SynPS/2 Synaptics TouchPad" && xinput set-button-map "SynPS/2 Synaptics TouchPad" 1 25 3 4 5 6 7

# source hostname-specific commands
if [ -f $HOME/profile.d/`hostname`.sh ]; then
     source $HOME//profile.d/`hostname`.sh
fi
