# Path
export PATH=~/.bin:$PATH
export PATH=./bin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

export EDITOR='nvim'
export LSCOLORS=GxBxhxDxfxhxhxhxhxcxcx
export GIT_PS1_SHOWDIRTYSTATE=1 # Show * for dirty repo in prompt

shopt -s autocd   # cd without cd
shopt -s globstar # Enable ** for recursive globbing

# Turn off flow control and free up C-s and C-q
stty -ixon

source ~/.alias

# initialize rbenv
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

### Prompt

# https://gist.github.com/alcesleo/e8628664df11b3218321
Color_Off='\[\e[0m\]'
IBlue='\[\e[0;94m\]'
IGreen='\[\e[0;92m\]'
IWhite='\[\e[0;97m\]'
IYellow='\[\e[0;93m\]'

PS1="\n$IYellow\A $IGreen\w $IBlue\$(__git_ps1 '(%s)')\n$IWhite\$$Color_Off "
