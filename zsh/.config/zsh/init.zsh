# Completion.
# Dedupe fpath so the completion set is identical in login and non-login shells;
# without this, brew's fpath additions made the set flip between shells and forced
# compinit to rebuild ~/.zcompdump every time (multi-second when files are cold).
typeset -U fpath
autoload -Uz compinit
# Always load the cached dump in the foreground with -C: it skips the security
# audit and the new-function rescan, so it never blocks (~10ms). The full rebuild
# that picks up newly installed completions reads ~1k files and stalls for
# seconds when they are cold in cache, so when the dump is stale (>24h) we run it
# in a DETACHED background job — the prompt is never on its critical path.
_zcd_dump=$HOME/.zcompdump
if [[ -e $_zcd_dump ]]; then
  compinit -C -d "$_zcd_dump"
  _zcd_stale=( $_zcd_dump(Nmh+24) )
  (( ${#_zcd_stale} )) && { compinit -d "$_zcd_dump" } &!
else
  compinit -d "$_zcd_dump"  # first run only: build synchronously
fi
unset _zcd_dump _zcd_stale

# Use git completion for the g alias
compdef g=git

# Case-insensitive tab completion (lowercase matches uppercase too)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Enable git prompt support
autoload -Uz vcs_info
precmd_functions+=(vcs_info)
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
