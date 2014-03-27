source $HOME/.zsh_prompt
source $HOME/.zsh/aliases

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# completions
autoload -U compinit
compinit -C

# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_cd

### vi keybindings
# http://dougblack.io/words/zsh-vi-mode.html
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1
### end vi keybindings

# fix forwards delete key
# http://superuser.com/questions/169920/binding-fn-delete-in-zsh-on-mac-os-x
bindkey "^[[3~" delete-char

export EDITOR=vim

# Prepend path
path=(
  'bin'
  '/usr/local/bin'
  $path
)
export PATH
