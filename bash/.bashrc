# Source bash completion and __git functions
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

source $HOME/.config/bash/prompt.sh
source $HOME/.config/bash/aliases.sh
