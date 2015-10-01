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

### Prompt

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# Set prompt
PS1="\n\[$IYellow\]\A \[$IGreen\]\w\[$IBlue\]\$(__git_ps1 \" (%s) \")\n\[$IWhite\]\$ \[$Color_Off\]"
