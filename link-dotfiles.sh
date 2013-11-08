#!/bin/zsh

# Get the path of this file
ABSPATH=$(cd "$(dirname "$0")"; pwd)

# link the bin folder
ln -fhs $ABSPATH/bin ~/.bin

# link prezto
ln -fhs $ABSPATH/prezto ~/.zprezto

# link all dotfiles to home dir
ln -fhsv $ABSPATH/home/*(D) ~/
