# ----- Initialization -----

if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
        . /usr/lib/git-core/git-sh-prompt
fi

# ----- Environment -----
export EDITOR='vim'

export GIT_PS1_SHOWDIRTYSTATE=1     # Show * and + for unstaged and staged changes
export GIT_PS1_SHOWUNTRACKEDFILES=1 # Show % for untracked files

export HISTCONTROL=ignoredups:ignorespace:erasedups
export HISTFILESIZE=10000
export HISTIGNORE='ls:bg:fg:history'
export HISTSIZE=10000
export PROMPT_COMMAND='history -a'  # Append history file after every command

export LANG=en_US
export TERM=xterm-256color

# ----- Bash Options -----
shopt -s autocd     # cd without cd
shopt -s extglob    # Enable negative globbing etc
shopt -s globstar   # Enable ** for recursive globbing
shopt -s histappend # Append command history on exit

# Turn off flow control and free up C-s and C-q
stty -ixon

# ----- Prompt -----
function exit_status() {
   local es=$?
   if [ $es -ne 0 ]; then
       echo -e " [$es]"
   fi
}

function background_jobs() {
   local j="$(jobs | grep 'Stopped\|Running' | awk '{ print $3 }' | paste -sd ',')"
   if [ $j ]; then
      echo " {$j}"
   fi
}

# https://gist.github.com/alcesleo/e8628664df11b3218321
Color_Off='\[\e[0m\]'
IBlue='\[\e[0;94m\]'
IGreen='\[\e[0;92m\]'
IRed='\[\e[0;91m\]'
IWhite='\[\e[0;97m\]'
IYellow='\[\e[0;93m\]'
IBlack='\[\e[0;90m\]'

# Set the prompt
#
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
PS1="\n$IYellow\A $IGreen\w $IBlue\$(__git_ps1 '(%s)')$IRed\$(exit_status)$IBlack\$(background_jobs)\n$IWhite\$$Color_Off "
