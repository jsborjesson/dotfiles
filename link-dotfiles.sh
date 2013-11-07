#!/bin/zsh

# Get the path of this file
ABSPATH=$(cd "$(dirname "$0")"; pwd)

# link the bin folder
ln -fhs $ABSPATH/bin ~/.bin

# link prezto
ln -fhs $ABSPATH/prezto ~/.zprezto

# Loop the files in ./home
for file ($ABSPATH/home/*) {
    ln -Ffhs $file ~/.${file##*/}
}

