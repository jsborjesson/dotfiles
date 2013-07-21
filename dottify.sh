#!/bin/zsh

# relentlessly symlink everything in home/ to ~
ln -Ffhs ~/Projects/dotfiles/home/.* ~

# bin folder
ln -s ~/Projects/dotfiles/bin ~/.bin

