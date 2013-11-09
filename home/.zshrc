
### Load modules ###

# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Z
source `brew --prefix`/etc/profile.d/z.sh

# RVM & NVM are sourced in plugins

### Convenient stuff ###

# Shortcuts
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

# Colorized cat
alias c='pygmentize -O style=monokai -f console256 -g'

# Python VirtualEnv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh
