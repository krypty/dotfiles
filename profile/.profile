# ensure anacron dirs and files exists, even if empty
mkdir -p "${HOME}"/.anacron/{etc,spool}
touch "${HOME}"/.anacron/etc/anacrontab
anacron -s -t "${HOME}"/.anacron/etc/anacrontab -S "${HOME}"/.anacron/spool

[[ $(hostname) == "erxpc33" ]] && export PRIMARY_MON=DP-0
[[ $(hostname) == "erxpc33" ]] && export WINIT_X11_SCALE_FACTOR='1.0'
[[ $(hostname) == "erxpc33" ]] && export ETH_IFACE='enp3s0'
[[ $(hostname) == "erxpc33" ]] && export WLAN_IFACE='wlan0'

[[ $(hostname) == "thinkpad-archlinux" ]] && export PRIMARY_MON=eDP-1
[[ $(hostname) == "thinkpad-archlinux" ]] && export WINIT_X11_SCALE_FACTOR='1.3'
[[ $(hostname) == "thinkpad-archlinux" ]] && export ETH_IFACE='xxx'
[[ $(hostname) == "thinkpad-archlinux" ]] && export WLAN_IFACE='xxx'

[[ $(hostname) == "tower" ]] && export PRIMARY_MON=HDMI-A-1
[[ $(hostname) == "tower" ]] && export WINIT_X11_SCALE_FACTOR='1.1'
[[ $(hostname) == "tower" ]] && export ETH_IFACE='enp3s0'

[[ $(hostname) == "archlinux-hp" ]] && export PRIMARY_MON=eDP-1
[[ $(hostname) == "archlinux-hp" ]] && export WINIT_X11_SCALE_FACTOR='1.2'
[[ $(hostname) == "archlinux-hp" ]] && export ETH_IFACE='enp1s0'
[[ $(hostname) == "archlinux-hp" ]] && export WLAN_IFACE='wlan0'

# Set eurkey as keyboard layout
setxkbmap eu
# Disable caps lock
setxkbmap -option caps:none
# Map Control_Right to (context) Menu
xmodmap -e "keycode 105 = Menu"
# Disable middle click on touchpad
xinput --list | grep "SynPS/2 Synaptics TouchPad" && xinput set-button-map "SynPS/2 Synaptics TouchPad" 1 25 3 4 5 6 7

# source hostname-specific commands
if [ -f "$HOME/profile.d/$(hostname).sh" ]; then
    source "$HOME/profile.d/$(hostname).sh"
fi
