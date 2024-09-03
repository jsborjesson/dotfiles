export EDITOR='vim'
export PATH="$PATH:~/.bin"

export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"
export HISTCONTROL='ignoredups:erasedups'
shopt -s histappend
