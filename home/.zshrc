
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# z
source /usr/local/Cellar/z/1.6/etc/profile.d/z.sh

# enter vi-mode with jj
bindkey -M viins 'jj' vi-cmd-mode


# vi-mode visual indicator
# bug: it eats up line above when changing mode
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- COMMAND --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
