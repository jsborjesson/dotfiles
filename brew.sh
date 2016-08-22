# Make sure we're on the latest Homebrew
brew update

# Upgrade already installed formulae
brew upgrade

brew install ag
brew install bash bash-completion
brew install cloc
brew install coreutils
brew install ctags
brew install emacs
brew install git
brew install grc
brew install htop
brew install hub
brew install python
brew install rbenv ruby-build
brew install tmux reattach-to-user-namespace
brew install tree
brew install yank
brew install z

# NeoVim
brew tap neovim/neovim
brew install --HEAD neovim

# Optional extras
# brew install heroku-toolbelt
# brew install jrnl
# brew install leiningen
# brew install pandoc
# brew install ranger
# brew install shellcheck

# Casks
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install caffeine
brew cask install dropbox
brew cask install emacs
brew cask install google-chrome
brew cask install iterm2
brew cask install karabiner
brew cask install keepassx
brew cask install seil
brew cask install spectacle
brew cask install the-unarchiver

# Optional extras
# brew cask install appcleaner
# brew cask install keycastr
# brew cask install licecap
# brew cask install postgres
# brew cask install sequel-pro
# brew cask install virtualbox

# Cleanup
brew cleanup
brew cask cleanup
