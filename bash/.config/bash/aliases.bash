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

# Shortcuts for the most common programs
alias v='vim'
alias g='git'
alias t='tmux'
alias d='docker'
alias dc='docker-compose'

# Shortcuts for moving folders
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Quickly create and move into folder
mkd() { mkdir -p "$1" && cd "$1"; }

# Shortcuts for getting columns
alias col-1="awk '{print \$NF}'"
alias col-2="awk '{print \$NF-2}'"
alias col-3="awk '{print \$NF-3}'"
alias col-4="awk '{print \$NF-4}'"
alias col-5="awk '{print \$NF-5}'"
alias col-6="awk '{print \$NF-6}'"
alias col-7="awk '{print \$NF-7}'"
alias col-8="awk '{print \$NF-8}'"
alias col-9="awk '{print \$NF-9}'"
alias col1="awk '{print \$1}'"
alias col2="awk '{print \$2}'"
alias col3="awk '{print \$3}'"
alias col4="awk '{print \$4}'"
alias col5="awk '{print \$5}'"
alias col6="awk '{print \$6}'"
alias col7="awk '{print \$7}'"
alias col8="awk '{print \$8}'"
alias col9="awk '{print \$9}'"

# Enable autocomplete for the g alias if available
type __git_complete >/dev/null 2>&1 && {
    __git_complete g __git_main
}
