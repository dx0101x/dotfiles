#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
# ─────────────────────────────────────────────────────────────────
# Fish-like PS1 prompt for Bash
# ─────────────────────────────────────────────────────────────────

# Colors
RESET="\[\e[0m\]"
BLACK="\[\e[30m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
WHITE="\[\e[37m\]"

# Git branch and dirty state
function __bash_git_prompt() {
  # Get branch name
  local branch
  branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null || \
           git rev-parse --short HEAD 2>/dev/null)"

  # If in a git repo
  if [[ -n "$branch" ]]; then
    # Check for dirty state
    local status
    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
      status="*"
    else
      status=""
    fi
    echo " ${branch}${status}"
  fi
}

# Return code indicator (red if nonzero)
function __bash_retval() {
  local exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    echo " ${RED}[✘ ${exit_code}]${RESET}"
  fi
}

# The PS1
export PS1="\n${GREEN}\u${RESET}@${BLUE}\h${RESET} ${CYAN}\w${RESET}$(__bash_git_prompt)$(__bash_retval)\n${YELLOW}➜ ${RESET}"
