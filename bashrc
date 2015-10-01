source ~/.aliases

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

shopt -s autocd   # cd without cd
shopt -s globstar # Enable ** for recursive globbing

# Path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH=~/.bin:$PATH
export PATH=./bin:$PATH

export LSCOLORS=GxBxhxDxfxhxhxhxhxcxcx # Make folder color visible

export EDITOR='nvim'

export GIT_PS1_SHOWDIRTYSTATE=1 # Show * for dirty repo

# Enable git completion for the g alias
__git_complete g __git_main

# Turn off flow control and free up C-s and C-q
stty -ixon

# Colors
# https://gist.github.com/alcesleo/e8628664df11b3218321
Color_Off='\e[0m'
IBlue='\e[0;94m'
IGreen='\e[0;92m'
IWhite='\e[0;97m'
IYellow='\e[0;93m'

# Set prompt
PS1="\n\[$IYellow\]\A \[$IGreen\]\w\[$IBlue\]\$(__git_ps1 \" (%s) \")\n\[$IWhite\]\$ \[$Color_Off\]"
