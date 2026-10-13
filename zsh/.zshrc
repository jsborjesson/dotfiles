source $HOME/.config/zsh/init.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/environment.zsh
source $HOME/.config/zsh/prompt.zsh


# Local gitignored settings
#
# When an installation of a program prompts you to append something
# to the .zshrc, you can opt to append .local to the command.
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
