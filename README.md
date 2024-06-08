# Dotfiles

## Installation

```bash
# Set up an SSH key
ssh-keygen -t ed25519 -C "email@example.com"
cat ~/.ssh/id_ed25519.pub

# Clone the repo
git clone git@github.com:jsborjesson/dotfiles.git

# To not accidentally commit with the wrong email for work stuff, email is set per repo
git config user.email "email@example.com"

# Ubuntu
sudo apt install stow

# Fedora
sudo dnf install stow xclip
echo ". /usr/share/git-core/contrib/completion/git-prompt.sh" >> ~/.bashrc.local

mv ~/.bashrc ~/.bashrc.bak
stow -vt ~ bash git vim tmux
```
