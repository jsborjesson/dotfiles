source $HOME/.config/bash/init.bash
source $HOME/.config/bash/aliases.bash
source $HOME/.config/bash/environment.bash
source $HOME/.config/bash/prompt.bash


# Local gitignored settings
#
# When an installation of a program prompts you to append something
# to the .bashrc, you can opt to append .local to the command.
if [ -f $HOME/.bashrc.local ]; then
    source $HOME/.bashrc.local
fi

# If running interactively and not already in Tmux, start it
[[ $TERM_PROGRAM != 'vscode' ]] && [[ $- == *i* ]] && [[ -z "$TMUX" ]] && exec tmux
