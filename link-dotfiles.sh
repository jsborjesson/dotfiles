#!/bin/zsh

# Get the path of this file
scriptdir=$(dirname $0)

# Loop the files in ./home
# this requires coreutils to be installed,
# if they are not, -n should be changed to -h
for file in $scriptdir/home/*;
do
    # The filename with a prepended dot
    dotfile=.${file##*/}

    # Make the link
    ln -Ffns $file ~/$dotfile
done

# link the bin folder
ln -fns $scriptdir/bin ~/.bin
