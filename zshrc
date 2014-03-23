source $HOME/.zsh_prompt
source $HOME/.zsh/aliases

## completions
autoload -U compinit
compinit -C

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Prepend path
path=(
  'bin'
  '/usr/local/bin'
  $path
)
export PATH
