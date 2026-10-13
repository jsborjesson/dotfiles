[[ -n ${functions[zsp]} ]] || source "$HOME/.config/zsh/_startup_profiler.zsh"
zsp init-start
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
_zsp_dump=$HOME/.zcompdump
_zsp_t0=$EPOCHREALTIME                        # TEMP profiling
if [[ -e $_zsp_dump ]]; then
  compinit -C -d "$_zsp_dump"
  _zsp_stale=( $_zsp_dump(Nmh+24) )
  (( ${#_zsp_stale} )) && { compinit -d "$_zsp_dump" } &!
else
  compinit -d "$_zsp_dump"                    # first run only: build synchronously
fi
zsp "compinit dur=$(( EPOCHREALTIME - _zsp_t0 )) fg-load fpath=${#fpath} login=${options[login]}"  # TEMP
zsp init-after-compinit                       # TEMP
unset _zsp_dump _zsp_t0 _zsp_stale            # TEMP

# Use git completion for the g alias
compdef g=git

# Case-insensitive tab completion (lowercase matches uppercase too)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Enable git prompt support
autoload -Uz vcs_info
precmd_functions+=(vcs_info)
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
