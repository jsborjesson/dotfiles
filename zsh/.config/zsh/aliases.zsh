# Quickly reload Zsh configuration
alias src='source ~/.zshrc'

# Enable coloring of common commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Shortcuts for ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Shortcuts for the most common programs
alias v='vim'
alias g='git'
alias d='docker'
alias dc='docker compose'
alias p='podman'
alias pc='podman compose'

# Shortcuts for moving folders
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Quickly create and move into folder
mkd() { mkdir -p "$1" && cd "$1"; }
