# Allow parameter expansion / substitution in the prompt
setopt PROMPT_SUBST

# Bright colors map to zsh color codes 8-15:
#   yellow=11  green=10  blue=12  red=9  white=15  black=8
#
# Prompt escapes used:
#   %T  current time (24h HH:MM)
#   %~  working directory (with ~)
#   ${vcs_info_msg_0_}  git branch, populated by vcs_info in init.zsh
#   %(?.. [%?])  exit status, only shown when non-zero
#   %(1j. {%j}.)  number of background jobs, only shown when >= 1
PROMPT=$'\n''%F{11}%T %F{10}%~ %F{12}${vcs_info_msg_0_}%F{9}%(?.. [%?])%F{8}%(1j. {%j}.)'$'\n''%F{15}$%f '
