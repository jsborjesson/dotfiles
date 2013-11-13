# Dotfiles

## Introduction

*OSX, ZSH, Sublime Text 3, Prezto, Git.*

These are *my* dotfiles. Feel free to do anything you want with them,
but don't expect them to take any opinions or needs other than mine into consideration.

## Instructions

### Command-line enviornment

1. Set **Zsh** as the default shell. `chsh -s zsh`
2. Clone this repo: `git clone --recursive git@github.com:alcesleo/dotfiles.git`
3. Backup your previous configuration-files, these scripts sure as hell won't.
4. Run `./link-dotfiles.sh` - this will create symlinks to all configuration-files
5. Set iTerm2 terminal to xterm-256 colors

#### Updating

To update, run this line - this will also keep Prezto up to date.

    git pull && git submodule update --init --recursive

### Sublime Text 3

Instructions are in `subl/README.md`

### Other

Some OSX-configuration is in the `scripts/osx.sh`.
A bunch of commands for installing apps are there aswell.

## Notes

Next time I install OSX - PLEASE USE CASE SENSITIVE FILE SYSTEM.
