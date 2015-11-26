# Dotfiles

## Installation

* Install the Mac OSX Command Line Tools.
* `rake -T` to see all the available commands and use them to install.

### Manual steps

* **iTerm2**
    * Set terminal type to `xterm-256color`.
    * Set longer scrollback
    * Split panes in same directory
    * Enable xterm mouse reporting
    * Enable "Keys -> option key acts as +Esc" to support Meta keys
* After `brew install`ing the new version of your preferred shell:
    * `sudo vim /etc/shells` and add it there. (Probably something like `/usr/local/bin/bash`)
    * `chsh -s /usr/local/bin/bash` to set it as default
* In `Keyboard` settings, remap Caps Lock to Control

### Ruby

Rbenv handles versions.

```bash
rbenv install -l     # list available ruby versions
rbenv install 2.1.2  # install the ruby you want
rbenv global 2.1.2   # set it as the default

# cannot live without bundle
gem install bundler
rbenv rehash

# Install global gems
bundle install --system
```

**Don't forget to run `rbenv rehash` after installing a gem that adds commands (like bundler).**

## Reinstallation

If you're doing a complete reinstall there are a few extra steps you need to
consider.

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

### Filesystem

I like the case sensitive one, it's not standard on Mac but it is the way it's
done on Linux, and I haven't found any issues with it. The only real difference
is that you can do things like `mv MyFile.txt myfile.txt` directly, having to
do a temporary rename pisses me off.

`brew doctor` will put up a warning but everything seems to work fine.
