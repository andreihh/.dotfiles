# ~/.bash_aliases: this file contains various user-defined aliases for
# interactive shells.

# Some more ls aliases.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors \
    && eval "$(dircolors -b ~/.dircolors)" \
    || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Attach to the "work" tmux session, or create it if it doesn't exist.
alias tmuxw='tmux new -A -s work'

# Prints the given message in red to stderr.
function echoerr() {
  echo -e "\033[0;31m$@\033[0m" >&2
}

# Redirects the given math operations to python3.
function calc() {
  [[ "$#" -ne 1 ]] \
    && echo "Usage: ${FUNCNAME[0]} <python3-math-expression>" \
    && return 1

  python3 -c "from math import *; print($1)"
}
