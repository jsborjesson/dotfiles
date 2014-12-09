source ~/.aliases

# initialize rbenv
eval "$(rbenv init -)"

# cd without cd
shopt -s autocd

# case insensitive tab complete
bind "set completion-ignore-case on"

# don't tab twice to show results
bind "set show-all-if-ambiguous on"

export EDITOR='vim'

# Path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
