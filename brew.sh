# Make sure we're on the latest Homebrew
brew update

# Upgrade already installed formulae
brew upgrade

brew install ag
brew install bash bash-completion
brew install git
brew install heroku-toolbelt
brew install homebrew/binary/kindlegen
brew install htop
brew install hub
brew install leiningen
brew install pandoc
brew install python python3
brew install rbenv ruby-build
brew install shellcheck
brew install tree
brew install z

# Casks
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install appcleaner
brew cask install caffeine
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install karabiner
brew cask install keepassx
brew cask install keycastr
brew cask install moom
brew cask install postgres
brew cask install skype
brew cask install sophos-anti-virus-home-edition
brew cask install spotify
brew cask install sqlitebrowser
brew cask install the-unarchiver

# Make sure the links work in alfred
brew cask alfred link

brew cleanup
