# ensure anacron dirs and files exists, even if empty
mkdir -p ${HOME}/.anacron/{etc,spool}
touch ${HOME}/.anacron/etc/anacrontab
anacron -s -t ${HOME}/.anacron/etc/anacrontab -S ${HOME}/.anacron/spool

export PRIMARY_MON=HDMI-2


# Disable caps lock
setxkbmap -option caps:none
# Map Control_Right to (context) Menu
xmodmap -e "keycode 105 = Menu"
# Disable middle click on touchpad
xinput set-button-map "SynPS/2 Synaptics TouchPad" 1 25 3 4 5 6 7
