# Make sure we're on the latest Homebrew
brew update

# Upgrade already installed formulae
brew upgrade

brew install bash bash-completion
brew install git
brew install zsh
brew install vim --with-python3 --with-ruby --override-system-vi
brew install rbenv ruby-build
brew install python python3
brew install leiningen
brew install tree
brew install ag
brew install hub
brew install sqlite
brew install heroku-toolbelt
brew install tmux reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
brew install htop

brew install pandoc
brew install homebrew/binary/kindlegen

# Casks
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install google-chrome
brew cask install iterm2
brew cask install moom
brew cask install dropbox
brew cask install keepassx
brew cask install caffeine
brew cask install flux
brew cask install spotify
brew cask install appcleaner
brew cask install skype
brew cask install seil
brew cask install karabiner
brew cask install dash
brew cask install sophos-anti-virus-home-edition
brew cask install postgres
brew cask install keycastr

# Fonts
brew tap caskroom/fonts
brew cask install font-sauce-code-powerline

# Make sure the links work in alfred
brew cask alfred link

brew cleanup
