#/bin/bash
echo "Stowing..."
stow xfce4-terminal -t ~/.config/xfce4/terminal/
echo "TODO add the others stow commands"
TODO foreach folder do
stow -v FOLDER_NAME

TODO create folder structure into each "stow app"
