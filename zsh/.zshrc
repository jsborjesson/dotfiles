source $HOME/.config/zsh/init.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/environment.zsh
source $HOME/.config/zsh/prompt.zsh


# Local gitignored settings
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
# bun completions
[ -s "/Users/borjim/.bun/_bun" ] && source "/Users/borjim/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
