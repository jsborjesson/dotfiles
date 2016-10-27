# Dotfiles

## Installation

Steps to install dotfiles on a fresh Mac OS installation:

1. Install developer tools

        xcode-select --install

2. Clone this repository

        mkdir ~/code && git clone https://github.com/alcesleo/dotfiles.git ~/code/dotfiles && cd ~/code/dotfiles

3. Install things
    * `rake brew` installs most essential software
    * `rake link` installs the configuration
    * `rake vim:install` install all Vim plugins
    * `rake karabiner:load` sets all of the keyboard shortcuts

4. Once you have your SSH keys installed, switch the protocol

        git remote set-url origin git@github.com:alcesleo/dotfiles.git

### Manual steps

* **iTerm2**
    * Set terminal type to `xterm-256color`.
    * Set longer scrollback
    * Reuse previous session's directory
    * Enable xterm mouse reporting
    * Enable "Profiles > Keys -> option key acts as +Esc" to support Meta keys
* **Settings**
    * Settings > General > Use dark menu bar
    * Settings > Accessibility > Display > Reduce transparency
    * Settings > Accessibility > Zoom
    * Settings > Displays > Automatically adjust brightness

### Vim

Lint VimScript to be extra clean:

```bash
pip install vim-vint
vint --style vimrc
```

### Ruby

```bash
rbenv install -l     # list available ruby versions
rbenv install 2.1.2  # install the ruby you want
rbenv global 2.1.2   # set it as the default

# Install the global system gems
rake gems
```

**Don't forget to run `rbenv rehash` after installing a gem that adds commands.**

The `railsrc` and `rails_template.rb` files take over the `rails new` command
and make it automatically do a lot of things that I tend to do directly after
running `rails new` anyway.

You can also install [rbenv-ctags](https://github.com/tpope/rbenv-ctags) to
allow tag jumps into the standard library too.

### SSH keys

Make sure to bring your `~/.ssh` with you when you reinstall.

If you copied it over and get an error like this:

    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    Permissions 0744 for '/home/geek/.ssh/id_rsa' are too open.
    It is recommended that your private key files are NOT accessible by others.
    This private key will be ignored.
    bad permissions: ignore key: /home/geek/.ssh/id_rsa

Then you need to set the permissions correctly, like so:

```bash
sudo chmod 600 ~/.ssh/id_rsa*
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 755 ~/.ssh
```

#### It keeps asking for the SSH passphrase

```bash
# Make sure ssh-agent is running
$ eval $(ssh-agent)
Agent pid 98949

# Add the key
$ ssh-add
```

### GPG keys

Use [GPG Suite](https://gpgtools.org/) to handle GPG keys

If you get this error, you need to uncomment `charset utf-8` in `~/.gnupg/gpg.conf`

    gpg: conversion from `US-ASCII' to `utf-8' failed: Illegal byte sequence
    gpg: conversion from `utf-8' to `US-ASCII' failed: Illegal byte sequence
