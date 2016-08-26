# ----- Path -----
source ~/.path

# ----- Exports -----
export EDITOR='nvim'
export TERM=xterm-256color

# ----- Go -----
if type go > /dev/null; then
    export GOPATH=~/code/go
    export PATH="$PATH:$GOPATH/bin"
fi

# ----- Settings -----
shopt -s autocd   # cd without cd
shopt -s globstar # Enable ** for recursive globbing

# Turn off flow control and free up C-s and C-q
stty -ixon


# ----- Initialization -----
# Aliases
source ~/.alias

# Initialize rbenv
eval "$(rbenv init -)"

# Source bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# Source z
if [ -f $(brew --prefix)/etc/profile.d/z.sh ]; then
    source $(brew --prefix)/etc/profile.d/z.sh
fi

# Enable git completion for the g alias
__git_complete g __git_main

# ----- Prompt -----
export GIT_PS1_SHOWDIRTYSTATE=1     # Show * for dirty repo in prompt
export GIT_PS1_SHOWUNTRACKEDFILES=1 # Show % for untracked files in prompt

function exit_status() {
   es=$?
   if ! [ $es -eq 0 ]; then
       # Without the space at the end, bash will truncate the newline
       echo -e "\nexit status: ${es}\n "
   fi
}

# https://gist.github.com/alcesleo/e8628664df11b3218321
Color_Off='\[\e[0m\]'
IBlue='\[\e[0;94m\]'
IGreen='\[\e[0;92m\]'
IRed='\[\e[0;91m\]'
IWhite='\[\e[0;97m\]'
IYellow='\[\e[0;93m\]'

PS1="$IRed\$(exit_status)\n$IYellow\A $IGreen\w $IBlue\$(__git_ps1 '(%s)')\n$IWhite\$$Color_Off "

# ----- bashrc.local -----
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
