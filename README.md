# Dotfiles

## Installation

* Install the Mac OSX [Command Line Tools](https://developer.apple.com/downloads/index.action).
* `rake -T` to see all the available commands and use them to install.

### Manual steps

* **iTerm2**
    * Set font to **Sauce Code Powerline** (installed by homebrew)
    * Set terminal type to `xterm-256color`
    * Set scrollbacklines to 0 to prevent 2-finger scrolling in Vim, use tmux instead
* Set the default shell to Zsh
* Rebind caps lock to escape using **Seil**.

### Homebrew

The `Brewfile` can be run with `brew bundle`.

### Zsh

You change the default shell to zsh using `chsh -s zsh`.

A new version of Zsh is installed with the Brewfile, you can check which version you are
running with:

```bash
# current version
echo $ZSH_VERSION

# other version
/bin/zsh --version
```

To be allowed to set the new version as the standard shell with `chsh -s zsh` you need to
make sure it is in `/etc/shells`, otherwise you'll get an error.

### Tmux

Starting a new terminal session is not enough to enable the clipboard settings in tmux, you might have to run:

    tmux kill-server

### Prompt

The `zsh_prompt` is autogenerated by
[promptline.vim](https://github.com/edkolev/promptline.vim).  Settings for the
prompt are in `vimrc`, change them, source it and regenerate with:

    :PromptlineSnapshot! ~/.zsh_prompt

**Don't change `zsh_prompt` directly.**

## Reinstallation

If you're doing a complete reinstall there are a few extra steps you need to
consider.

#### SSH keys

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

#### Filesystem

I like the case sensitive one, it's not standard on Mac but it is the way it's
done on Linux, and I haven't found any issues with it. The only real difference
is that you can do things like `mv MyFile.txt myfile.txt` directly, having to
do a temporary rename pisses me off.

`brew doctor` will put up a warning but everything seems to work fine.
