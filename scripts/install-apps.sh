#!/bin/zsh

# Here I list lots of useful apps by their install-command
# You can probably run this file as a script, but I would
# use it as a copy-paste-board.

# TODO
# nvm
# xquartz

##############################
## Ruby
##############################

# install rvm and update ruby
curl -L https://get.rvm.io | bash
rvm install 2.0

# install gems
gem install localtunnel
gem install guard
gem install guard-livereload

##############################
## Python
##############################

brew install python3 # IMPORTANT: This breaks the filewatcher in Sublime Text 3 (Build 3047)
pip3 install Pygments
pip3 install yuml

##############################
## Homebrew formulas
##############################

brew install ack
brew install gibo
brew install git # newer version than xcode's
brew install git-ftp
brew install htop
brew install multimarkdown
brew install tree
brew install z # sourced in zshrc

##############################
## PHP
##############################

brew tap homebrew/dupes # dep for php55
brew tap josegonzalez/homebrew-php
brew install php55 --with-mysql
brew install mysql
brew install phpmyadmin
brew install composer
brew install phpunit
brew install php55-xdebug
# pear install PHP_CodeSniffer
brew install php-cs-fixer # may need manual install using curl, this didn't work for me last time

##############################
## GUI applications (casks)
##############################

# Tap the brew
brew tap phinze/homebrew-cask
brew install brew-cask

# Install them in the native Application folder
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew cask install alfred
brew cask install dia
brew cask install dropbox
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install iterm2
brew cask install keepass-x # Preliminary, I use the alpha-version which is not yet in homebrew.
brew cask install moom
brew cask install spotify
# brew cask install sublime-text # Waiting for ST3 to be a cask
brew cask install the-unarchiver
brew cask isntall transmission
brew cask install virtualbox
brew cask install vlc

# Make alfred work
brew cask alfred link

brew cleanup

exit 0
