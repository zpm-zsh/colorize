#!/usr/bin/env zsh
# Standarized $0 handling, following:
# https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *b* ]] {
  PATH=$PATH:"${0:h}/bin"
}

DEPENDENCES_ARCH+=( grc )
DEPENDENCES_DEBIAN+=( grc )

export GREP_COLOR='4;31'
export LESS_TERMCAP_mb=$'\E[00;32m'
export LESS_TERMCAP_md=$'\E[00;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS='-R -M'

function grep() {
  command grep --colour=auto "$@"
}

function egrep() {
  command egrep --colour=auto "$@"
}

function fgrep() {
  command fgrep --colour=auto "$@"
}

if (( $+commands[grc] )); then
  function env() {
    command grc --colour=auto env "$@"
  }

  function lsblk() {
    command grc --colour=auto lsblk "$@"
  }

  function df() {
    command grc --colour=auto df -h "$@"
  }

  function du() {
    command grc --colour=auto du -h "$@"
  }

  function free() {
    command grc --colour=auto free -h "$@"
  }

  function as() {
    command grc --colour=auto as "$@"
  }

  function diff() {
    command grc --colour=auto diff --color "$@"
  }

  if (( $+commands[dig] )); then
    function dig() {
      command grc --colour=auto dig "$@"
    }
  fi

  if (( $+commands[gas] )); then
    function gas() {
      command grc --colour=auto gas "$@"
    }
  fi

  if (( $+commands[gcc] )); then
    function gcc() {
      command grc --colour=auto gcc "$@"
    }
  fi

  if (( $+commands[g++] )); then
    function g() ++(){
      command grc --colour=auto g++ "$@"
    }
  fi

  if (( $+commands[last] )); then
    function last() {
      command grc --colour=auto last "$@"
    }
  fi

  if (( $+commands[ld] )); then
    function ld() {
      command grc --colour=auto ld "$@"
    }
  fi

  if (( $+commands[ifconfig] )); then
    function ifconfig() {
      command grc --colour=auto ifconfig "$@"
    }
  fi

  if (( $+commands[mount] )); then
    function mount() {
      command grc --colour=auto mount "$@"
    }
  fi

  if (( $+commands[mtr] )); then
    function mtr() {
      command grc --colour=auto mtr "$@"
    }
  fi

  if (( $+commands[netstat] )); then
    function netstat() {
      command grc --colour=auto netstat "$@"
    }
  fi

  if (( $+commands[ping] )); then
    function ping() {
      command grc --colour=auto ping "$@"
    }
  fi

  if (( $+commands[ping6] )); then
    function ping6() {
      command grc --colour=auto ping6 "$@"
    }
  fi

  if (( $+commands[ps] )); then
    function ps() {
      command grc --colour=auto ps "$@"
    }
  fi

  if (( $+commands[traceroute] )); then
    function traceroute() {
      command grc --colour=auto traceroute "$@"
    }
  fi
fi
