function exit_status() {
   local es=$?
   if [ $es -ne 0 ]; then
       echo -e " [$es]"
   fi
}

function background_jobs() {
   local j="$(jobs -s |  awk '{ print $3 }' | paste -sd ',')"
   if [ $j ]; then
      echo " {$j}"
   fi
}

# https://gist.github.com/jsborjesson/e8628664df11b3218321
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
