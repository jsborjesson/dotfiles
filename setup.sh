#!/usr/bin/env bash

SCRIPT_PATH=$(pwd)

ln -sfnv $SCRIPT_PATH/bash/alias ~/.alias
ln -sfnv $SCRIPT_PATH/bash/bash_profile ~/.bash_profile
ln -sfnv $SCRIPT_PATH/bash/bashrc ~/.bashrc
ln -sfnv $SCRIPT_PATH/bash/hushlogin ~/.hushlogin
ln -sfnv $SCRIPT_PATH/bash/inputrc ~/.inputrc
ln -sfnv $SCRIPT_PATH/bash/path ~/.path
ln -sfnv $SCRIPT_PATH/bin/ ~/.bin
ln -sfnv $SCRIPT_PATH/emacs ~/.emacs
ln -sfnv $SCRIPT_PATH/env ~/.env
ln -sfnv $SCRIPT_PATH/git/git_template/ ~/.git_template
ln -sfnv $SCRIPT_PATH/git/gitconfig ~/.gitconfig
ln -sfnv $SCRIPT_PATH/git/gitconfig-mac ~/.gitconfig-mac
ln -sfnv $SCRIPT_PATH/git/gitignore ~/.gitignore
ln -sfnv $SCRIPT_PATH/jrnl_config ~/.jrnl_config
ln -sfnv $SCRIPT_PATH/psqlrc ~/.psqlrc
ln -sfnv $SCRIPT_PATH/ruby/bundle/ ~/.bundle
ln -sfnv $SCRIPT_PATH/ruby/gemrc ~/.gemrc
ln -sfnv $SCRIPT_PATH/ruby/pryrc ~/.pryrc
ln -sfnv $SCRIPT_PATH/ruby/rails_template.rb ~/.rails_template.rb
ln -sfnv $SCRIPT_PATH/ruby/railsrc ~/.railsrc
ln -sfnv $SCRIPT_PATH/tmux.conf ~/.tmux.conf
ln -sfnv $SCRIPT_PATH/vim ~/.vim

ln -sfnv $SCRIPT_PATH/spectacle/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json
ln -sfnv $SCRIPT_PATH/karabiner/ ~/.config/
ln -sfnv $SCRIPT_PATH/macos/ssh/config ~/.ssh/config
