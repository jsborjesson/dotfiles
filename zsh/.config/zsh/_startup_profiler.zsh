# zsh startup profiler — TEMPORARY debug instrumentation.
# Records high-resolution timestamps at checkpoints to a log file so an
# intermittent slow startup can be caught and localized after the fact.
# Remove with: rm ~/.config/zsh/_startup_profiler.zsh  and delete the
# `zsp ...` lines from .zprofile and ~/.config/zsh/*.zsh
#
# Analyze the last startup with:
#   ~/.config/zsh/_startup_profiler.zsh --report   (run via: zsh ~/.config/zsh/_startup_profiler.zsh --report)

if [[ "$1" == "--report" ]]; then
  # Report mode: print per-checkpoint deltas for the slowest recorded startup.
  log=${ZSP_LOG:-$HOME/.zsh-startup.log}
  [[ -r "$log" ]] || { print "no log at $log yet"; exit 0; }
  awk '
    { pid=$2; t[pid","(++n[pid])]=$1; lbl[pid","n[pid]]=$3; cnt[pid]=n[pid];
      if ($3=="first-prompt" || cnt[pid]>last_cnt[pid]) {}
      first[pid]= (first[pid]==""?$1:first[pid]); lastt[pid]=$1 }
    END {
      worst=""; worstdur=0
      for (p in cnt) { d=lastt[p]-first[p]; if (d>worstdur){worstdur=d; worst=p} }
      if (worst=="") { print "no complete startups recorded"; exit }
      printf "Slowest startup: pid %s, total %.3fs\n", worst, worstdur
      printf "%-22s %10s %10s\n","checkpoint","delta(s)","abs(s)"
      prev=""
      for (i=1;i<=cnt[worst];i++){
        cur=t[worst","i]
        dlt=(prev==""?0:cur-prev)
        printf "%-22s %10.3f %10.3f\n", lbl[worst","i], dlt, cur-first[worst]
        prev=cur
      }
    }' "$log"
  exit 0
fi

# Instrumentation mode (sourced during startup).
zmodload zsh/datetime 2>/dev/null
: ${ZSP_LOG:=$HOME/.zsh-startup.log}
zsp() { print -r -- "${EPOCHREALTIME} $$ $1" >> "$ZSP_LOG"; }
