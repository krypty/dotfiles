#/usr/bin/env bash
sed -i 's|colors: \*dark|colors: *light|' ~/.config/alacritty/alacritty.yml

sed -i "s|set -g @tmux-gruvbox 'dark'|set -g @tmux-gruvbox 'light'|" ~/.tmux.conf
tmux source-file ~/.tmux.conf
