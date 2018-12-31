#!/usr/bin/env bash

SCRIPT_PATH=$(pwd)

ln -sfnv $SCRIPT_PATH/alias ~/.alias
ln -sfnv $SCRIPT_PATH/bash_profile ~/.bash_profile
ln -sfnv $SCRIPT_PATH/bashrc ~/.bashrc
ln -sfnv $SCRIPT_PATH/bin/ ~/.bin
ln -sfnv $SCRIPT_PATH/bundle/ ~/.bundle
ln -sfnv $SCRIPT_PATH/emacs ~/.emacs
ln -sfnv $SCRIPT_PATH/env ~/.env
ln -sfnv $SCRIPT_PATH/gemrc ~/.gemrc
ln -sfnv $SCRIPT_PATH/git_template/ ~/.git_template
ln -sfnv $SCRIPT_PATH/gitconfig ~/.gitconfig
ln -sfnv $SCRIPT_PATH/gitignore ~/.gitignore
ln -sfnv $SCRIPT_PATH/hushlogin ~/.hushlogin
ln -sfnv $SCRIPT_PATH/inputrc ~/.inputrc
ln -sfnv $SCRIPT_PATH/jrnl_config ~/.jrnl_config
ln -sfnv $SCRIPT_PATH/path ~/.path
ln -sfnv $SCRIPT_PATH/pryrc ~/.pryrc
ln -sfnv $SCRIPT_PATH/psqlrc ~/.psqlrc
ln -sfnv $SCRIPT_PATH/rails_template.rb ~/.rails_template.rb
ln -sfnv $SCRIPT_PATH/railsrc ~/.railsrc
ln -sfnv $SCRIPT_PATH/tmux.conf ~/.tmux.conf
ln -sfnv $SCRIPT_PATH/vim ~/.vim
ln -sfnv $SCRIPT_PATH/vimrc ~/.vimrc

ln -sfnv $SCRIPT_PATH/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json
ln -sfnv $SCRIPT_PATH/karabiner/ ~/.config/
