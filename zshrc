source $HOME/.zsh_prompt
source $HOME/.zsh/aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

## completions
autoload -U compinit
compinit -C

## case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_cd

export EDITOR=vim

# Prepend path
path=(
  'bin'
  '/usr/local/bin'
  $path
)
export PATH
