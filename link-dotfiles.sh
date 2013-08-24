#!/bin/zsh

# Get the path of this file
ABSPATH=$(cd "$(dirname "$0")"; pwd)

# Loop the files in ./home
for file ($ABSPATH/home/*) {
    ln -Ffhs $file ~/.${file##*/}
}
# link the bin folder
ln -fhs $ABSPATH/bin ~/.bin
