source $HOME/.config/zsh/init.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/environment.zsh
source $HOME/.config/zsh/prompt.zsh


# Local gitignored settings
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

# If running interactively and not already in Tmux, start it
if [[ $TERM_PROGRAM != 'vscode' ]] && [[ $- == *i* ]] && [[ -z "$TMUX" ]] && command -v tmux &>/dev/null; then
    exec tmux
fi
