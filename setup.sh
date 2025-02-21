#!/usr/bin/env bash
set -euo pipefail 

mkdir -p ~/Projects

if [ ! -f ~/Projects/dotfiles ]; then
  git clone https://github.com/jsborjesson/dotfiles.git ~/Projects/dotfiles
fi

cd ~/Projects/dotfiles

if [ -f ~/.bashrc ]; then
   echo "Backing up old .bashrc"
   mv ~/.bashrc ~/.bashrc.bak
fi

stow -vt ~ bash git vim tmux 

chsh -s /bin/bash $USER

