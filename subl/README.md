# Configuration for Sublime Text

## Install

1. Install Sublime Text and [Package Control].
2. Symlink this directory as the `Packages/User` folder.
3. Run "Package Control: Upgrade/Overwrite All Packages" to install all the packages (listed in the Package Control.sublime-settings).

## Notes

To install spellchecks, clone `SublimeText/Dictionaries` and put them in `Packages/Language - German/` for example. Now the language will show up under `View > Dictionary`.

The best way of dealing with manually installed plugins, I've found, is to leave the `Installed Packages` for [Package Control] to handle by itself, and install the manual ones in `Packages` using `git clone`, and eventually checking out the ST3-branch.

[Package Control]: http://wbond.net/sublime_packages/package_control
