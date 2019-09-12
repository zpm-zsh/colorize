#!/usr/bin/env zsh

export GREP_COLOR='4;31'
export PAGER=${PAGER:-"less"}

export LESS_TERMCAP_mb=$'\E[00;32m'
export LESS_TERMCAP_md=$'\E[00;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS='-R -M'
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

PYGMENTIZE_THEME=${PYGMENTIZE_THEME:-"monokai"}

function grep(){
  =grep --colour=auto "$@"
}

function egrep(){
  =egrep --colour=auto "$@"
}

function fgrep(){
  =fgrep --colour=auto "$@"
}

_pygmentize_theme(){
  if (( $+commands[pygmentize] )); then
    export LESSOPEN="|pygmentize -O style=$PYGMENTIZE_THEME -f console16m -g %s"
    alias pygmentize="pygmentize -O style=$PYGMENTIZE_THEME -f console16m -g"
  fi
  precmd_functions=(${precmd_functions#_pygmentize_theme})
}

precmd_functions+=( _pygmentize_theme )

if (( $+commands[grc] )); then

  function env(){
    =grc --colour=auto env -h "$@"
  }

  function df(){
    =grc --colour=auto df -h "$@"
  }

  function du(){
    =grc --colour=auto du -h "$@"
  }

  function free(){
    =grc --colour=auto free -h "$@"
  }

  function as(){
    =grc --colour=auto as "$@"
  }

  function diff(){
    =grc --colour=auto diff --color "$@"
  }

  if (( $+commands[dig] )); then
    function dig(){
      =grc --colour=auto dig "$@"
    }
  fi

  if (( $+commands[gas] )); then
    function gas(){
      =grc --colour=auto gas "$@"
    }
  fi

  if (( $+commands[gcc] )); then
    function gcc(){
      =grc --colour=auto gcc "$@"
    }
  fi

  if (( $+commands[g++] )); then
    function g++(){
      =grc --colour=auto g++ "$@"
    }
  fi

  if (( $+commands[last] )); then
    function last(){
      =grc --colour=auto last "$@"
    }
  fi

  if (( $+commands[ld] )); then
    function ld(){
      =grc --colour=auto ld "$@"
    }
  fi

  if (( $+commands[ifconfig] )); then
    function ifconfig(){
      =grc --colour=auto ifconfig "$@"
    }
  fi

  if (( $+commands[mount] )); then
    function mount(){
      =grc --colour=auto mount "$@"
    }
  fi

  if (( $+commands[mtr] )); then
    function mtr(){
      =grc --colour=auto mtr "$@"
    }
  fi

  if (( $+commands[netstat] )); then
    function netstat(){
      =grc --colour=auto netstat "$@"
    }
  fi

  if (( $+commands[ping] )); then
    function ping(){
      =grc --colour=auto ping "$@"
    }
  fi

  if (( $+commands[ping6] )); then
    function ping6(){
      =grc --colour=auto ping6 "$@"
    }
  fi

  if (( $+commands[ps] )); then
    function ps(){
      =grc --colour=auto ps "$@"
    }
  fi

  if (( $+commands[traceroute] )); then
    function traceroute(){
      =grc --colour=auto traceroute "$@"
    }
  fi

fi
