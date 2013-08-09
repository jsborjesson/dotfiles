# Configuration for Sublime Text

## Install

1. Install Sublime Text and [Package Control].
2. Symlink this directory as the `Packages/User` folder.
3. Run "Package Control: Upgrade/Overwrite All Packages" to install all the packages (listed in the Package Control.sublime-settings).

## Notes

Since ST3 is still pretty new, a lot of the packages that show up in [Package Control] will not work.

The best way of dealing with manually installed plugins, I've found, is to leave the `Installed Packages` for [Package Control] to handle by itself, and install the manual ones in `Packages` using `git clone`, and eventually checking out the ST3-branch.


[Package Control]: http://wbond.net/sublime_packages/package_control
