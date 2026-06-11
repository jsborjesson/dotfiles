# Completion
autoload -Uz compinit && compinit

# Use git completion for the g alias
compdef g=git

# Enable git prompt support
autoload -Uz vcs_info
precmd_functions+=(vcs_info)
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
