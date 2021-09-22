#!/bin/bash

if [[ $EUID > 0 ]]
  then echo "Please run as root."
  exit
fi

echo "Cloning Gruvbox theme..."
git clone https://github.com/jmattheis/gruvbox-dark-gtk /usr/share/themes/gruvbox

echo "Cloning Gruvbox icons..."
git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk /usr/share/icons/gruvbox

echo "Clonning setting script..."
curl https://raw.githubusercontent.com/raitonoberu/archcraft-xfce-gruvbox/master/Gruvbox.sh --output /usr/share/archcraft/styles/Gruvbox.sh

echo "Setting up the theme..."
/usr/share/archcraft/styles/Gruvbox.sh

echo "Done."