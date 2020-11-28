# Quickly reload Bash configuration
alias src='source ~/.bashrc'

# Enable coloring of common commands
#
# Extracted from Ubuntu's .bashrc
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Shortcuts for ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# One letter commands for the most common programs
alias v='vim'
alias g='git'
alias t='tmux'

# Shortcuts for moving up the tree
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Enable autocomplete for the g alias if available
type __git_complete >/dev/null 2>&1 && {
    __git_complete g __git_main
}
