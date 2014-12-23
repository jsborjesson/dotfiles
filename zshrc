source $HOME/.aliases
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

### Emacs mode
bindkey -e
export KEYTIMEOUT=1

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

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "[%b]"
precmd() {
    vcs_info
}
setopt prompt_subst

PROMPT='%B%t%b %0~ ${vcs_info_msg_0_}$ '
