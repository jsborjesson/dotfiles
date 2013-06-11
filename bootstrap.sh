#!/bin/bash

# This file initializes/updates all the dotfiles - start here.

# Makes it possible to source this file without being in the dir
cd "$(dirname "${BASH_SOURCE}")"
git pull

# Copy all relevant dotfiles to ~
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}

# Prompt for overwrite, or force
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile