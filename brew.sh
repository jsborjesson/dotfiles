# Make sure we're on the latest Homebrew
brew update

# Upgrade already installed formulae
brew upgrade

brew tap homebrew/versions

brew install ag
brew install bash bash-completion2
brew install cloc
brew install coreutils
brew install ctags
brew install docker-compose
brew install emacs
brew install fzf
brew install git
brew install grc
brew install htop
brew install hub
brew install kpcli
brew install mycli pgcli
brew install python python3
brew install rbenv ruby-build
brew install shellcheck
brew install tmux reattach-to-user-namespace
brew install tree
brew install vim --with-python3
brew install watch
brew install yank
brew install z

# Casks
brew tap caskroom/cask
brew tap caskroom/versions

brew cask install caffeine
brew cask install docker
brew cask install dropbox
brew cask install emacs
brew cask install force-paste
brew cask install google-chrome
brew cask install iterm2
brew cask install karabiner
brew cask install keepassx
brew cask install licecap
brew cask install seil
brew cask install slack
brew cask install spectacle
brew cask install the-unarchiver

# Optional extras
# brew cask install appcleaner
# brew cask install keycastr
# brew cask install postgres
# brew cask install sequel-pro
# brew cask install tunnelblick
# brew cask install virtualbox

# Cleanup
brew cleanup
brew cask cleanup
