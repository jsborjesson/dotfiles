source ~/.aliases

# initialize rbenv
eval "$(rbenv init -)"

# Source bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# cd without cd
shopt -s autocd

# case insensitive tab complete
bind "set completion-ignore-case on"

# don't tab twice to show results
bind "set show-all-if-ambiguous on"

export EDITOR='vim'

# Turn off flow control and free up C-s and C-q
stty -ixon

# Cycle through completions
# [[ $- = *i* ]] && bind TAB:menu-complete

# Path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH=./bin:$PATH

# Set prompt
PS1="\n\A \w\$(__git_ps1 \" (%s) \")\n\$ "
