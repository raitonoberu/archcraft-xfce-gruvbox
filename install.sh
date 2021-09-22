#!/bin/bash

echo "Cloning Gruvbox theme..."
sudo git clone https://github.com/jmattheis/gruvbox-dark-gtk /usr/share/themes/gruvbox

echo "Cloning Gruvbox icons..."
sudo git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk /usr/share/icons/gruvbox
sudo gtk-update-icon-cache /usr/share/icons/gruvbox

echo "Clonning setting script..."
sudo curl https://raw.githubusercontent.com/raitonoberu/archcraft-xfce-gruvbox/master/Gruvbox.sh --output /usr/share/archcraft/styles/Gruvbox.sh

echo "Setting up the theme..."
/usr/share/archcraft/styles/Gruvbox.sh

echo "Done."
