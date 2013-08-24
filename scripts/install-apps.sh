#!/bin/zsh

# Here I list lots of useful apps by their install-command
# You can run this file as a script, but I would probably
# use it as a copy-paste-board.

# TODO
# nvm

gem install localtunnel

## Homebrew formulas ##

brew install ack
brew install gibo
brew install git # newer version than xcode's
brew install git-ftp
brew install htop
brew install multimarkdown
brew install python3
brew install tree
brew install z # sourced in zshrc

# PHP
brew tap homebrew/dupes # dep for php55
brew tap josegonzalez/homebrew-php
brew install php55

# php55-xdebug config at <https://github.com/martomo/SublimeTextXdebug>,
# mamp file in /Applications/MAMP/bin/php/php5.4.10/conf/php.ini
# insert shit there
brew install php55-xdebug

# pear install PHP_CodeSniffer
brew install php-cs-fixer # may need manual install using curl, this didn't work for me last time

# Install native apps
#
# Tap the brew
brew tap phinze/homebrew-cask
brew install brew-cask

# Install them in the native Application folder, don't know if this works
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew cask install alfred
brew cask install dropbox
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install iterm2
# preliminary, I use the alpha-version which is not yet in homebrew. NOTE: When
# NOTE: When syncing with Dropbox, mobile devices need to set the keepass.kpdx-file
# as favorite for it to work with Keepass2Android
brew cask install keepass-x
brew cask install moom
brew cask install spotify
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install virtualbox
brew cask install vlc

# Make alfred work
brew cask alfred link

brew cleanup

exit 0
