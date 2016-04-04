# Make sure we're on the latest Homebrew
brew update

# Upgrade already installed formulae
brew upgrade

brew install ag
brew install bash bash-completion
brew install ctags
brew install git
brew install heroku-toolbelt
brew install htop
brew install hub
brew install jrnl
brew install leiningen
brew install pandoc
brew install python python3
brew install ranger
brew install rbenv ruby-build
brew install shellcheck
brew install tmux reattach-to-user-namespace
brew install tree
brew install z

# NeoVim
brew tap neovim/neovim
brew install --HEAD neovim

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
brew cask install licecap
brew cask install postgres
brew cask install spectacle
brew cask install the-unarchiver

brew cleanup
