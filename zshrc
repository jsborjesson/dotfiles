source $HOME/.zsh_prompt
source $HOME/.zsh/aliases


# Prepend path
path=(
  'bin'
  '/usr/local/bin'
  $path
)
export PATH
