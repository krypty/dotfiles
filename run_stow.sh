#/bin/bash
echo "Stowing..."
stow xfce4-terminal -t ~/.config/xfce4/terminal/
echo "TODO add the others stow commands"
TODO foreach folder do
stow -v FOLDER_NAME

TODO create folder structure into each "stow app"

rm ~/.zshrc
stow -v zsh -t ~

# tmux
stow -v -t ~ tmux

# redshift
stow -v redshift -t ~/.config

# git
stow -v git -t ~ 

# ranger 
stow -v -t ~/.config/ranger ranger
stow -v dircolors -t ~
stow -t ~/.config/Code/User vscode
