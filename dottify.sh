#!/bin/zsh

# Get the path of this file
scriptdir=$(dirname $0)

# Loop the files in ./home
for file in $scriptdir/home/*;
do
    # The filename with a prepended dot
    dotfile=.${file##*/}

    # Make the link
    ln -Ffhs $file ~/$dotfile
done

# link the bin folder
ln -fhs $scriptdir/bin ~/.bin

