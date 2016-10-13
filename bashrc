# ----- Load files -----
source ~/.path
source ~/.alias

# ----- Exports -----
export EDITOR='vim'
export TERM=xterm-256color
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE='ls:bg:fg:history'
export PROMPT_COMMAND='history -a'  # Append history file after every command
export GOPATH=~/code/go
export GIT_PS1_SHOWDIRTYSTATE=1     # Show * for dirty repo in prompt
export GIT_PS1_SHOWUNTRACKEDFILES=1 # Show % for untracked files in prompt

# ----- Settings -----
shopt -s autocd     # cd without cd
shopt -s globstar   # Enable ** for recursive globbing
shopt -s histappend # Append command history on exit

# Turn off flow control and free up C-s and C-q
stty -ixon

# ----- Initialization -----

# Initialize rbenv
eval "$(rbenv init -)"

# Initialize bash completion
[ -f $(brew --prefix)/share/bash-completion/bash_completion ] && source $(brew --prefix)/share/bash-completion/bash_completion

# Initialize z
[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh

# Initialize fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Enable git completion for the g alias
__git_complete g __git_main

# ----- Prompt -----
function exit_status() {
   es=$?
   if ! [ $es -eq 0 ]; then
       echo -e "[${es}]"
   fi
}

# https://gist.github.com/alcesleo/e8628664df11b3218321
Color_Off='\[\e[0m\]'
IBlue='\[\e[0;94m\]'
IGreen='\[\e[0;92m\]'
IRed='\[\e[0;91m\]'
IWhite='\[\e[0;97m\]'
IYellow='\[\e[0;93m\]'

PS1="\n$IYellow\A $IGreen\w $IBlue\$(__git_ps1 '(%s)') $IRed\$(exit_status)\n$IWhite\$$Color_Off "

# ----- bashrc.local -----
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
