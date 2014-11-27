source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/vim_mode

# rbenv
eval "$(rbenv init -)"

# completions
autoload -U compinit
compinit -C

# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# cd without cd
setopt auto_cd

# Leave patterns which has no matches as they are, instead of printing
# an error. This prevents the need to use noglob in many cases.
unsetopt nomatch

# allow other apps to use ctrl-s
stty -ixon -ixoff

### vi keybindings
# http://dougblack.io/words/zsh-vi-mode.html
bindkey -v
export KEYTIMEOUT=1
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# fix forward delete key
# http://superuser.com/questions/169920/binding-fn-delete-in-zsh-on-mac-os-x
bindkey "^[[3~" delete-char

export EDITOR=vim

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export LSCOLORS=ExCxFxFxBxGxGxababaeae

# Prepend path
path=(
  './bin'
  '/usr/local/bin'
  $HOME/.bin
  $path
)
export PATH

# Customize prompt
PROMPT='%B%t%b %0~$ '
