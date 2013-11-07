# Configuration for Sublime Text

## Install

1. Install Sublime Text and [Package Control].
2. Symlink this directory **as** the `Packages/User` folder.
3. Run "Package Control: Upgrade/Overwrite All Packages" to install all the packages (listed in `Package Control.sublime-settings`).

## Notes

### Spellcheck

To install spellchecks, clone `SublimeText/Dictionaries` and put them in `Packages/Language - German/` for example. Now the language will show up under `View > Dictionary`.

### Manually installing plugins

The best way of dealing with manually installed plugins, I've found, is to leave the `Installed Packages`
for [Package Control] to handle by itself, and install the manual ones in `Packages`
using `git clone`, and eventually checking out the ST3-branch.

The current manually installed packages are:

- `ingshtrom/BlockCursorEverywhere` (this is no longer being updated, should be replaced shortly)
- `dnatag/SublimeTODO` (fork for st3)

### Fixing path for build systems

Sublime sadly does not use the same $PATH variable as your terminal. To get certain build systems working that require
things that are not in your default path **(this is often the case if you use homebrew, rvm, nvm etc.)** you need to do this:

1. Get the current path

        echo $PATH

2. Edit `/etc/launchd.conf` (if it's not there - create it)

        # Replace THE_PATH with the output from previous command
        setenv PATH THE_PATH

3. Restart your computer

[Package Control]: http://wbond.net/sublime_packages/package_control

### Misc tips and tricks

`ctrl + number` to switch between panels
