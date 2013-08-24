#!/bin/zsh

# Get the path of this file
ABSPATH=$(cd "$(dirname "$0")"; pwd)

# Loop the files in ./home
for file in $ABSPATH/home/*;
do
    # The filename with a prepended dot
    dotfile=.${file##*/}

    # Make the link
    ln -Ffhs $file ~/$dotfile
done

# link the bin folder
ln -fhs $ABSPATH/bin ~/.bin
