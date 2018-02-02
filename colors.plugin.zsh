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

PYGMENTIZE_THEME=${PYGMENTIZE_THEME:-"monokai"}

_pygmentize_theme(){
  if (( $+commands[pygmentize] )); then
    export LESSOPEN="|pygmentize -f 256 -O style=$PYGMENTIZE_THEME -g %s"
    alias pygmentize="pygmentize -O style=$PYGMENTIZE_THEME"
  fi
  precmd_functions=(${precmd_functions#_pygmentize_theme})
}

precmd_functions+=( _pygmentize_theme )

if (( $+commands[grc] )); then

  alias df="$(whence grc) --colour=auto $(whence df)"

  alias as="$(whence grc) --colour=auto $(whence as)"

  alias diff="$(whence grc) --colour=auto $(whence diff)"

  if (( $+commands[dig] )); then
    alias dig="$(whence grc) --colour=auto $(whence dig)"
  fi

  if (( $+commands[gas] )); then
    alias gas="$(whence grc) --colour=auto $(whence gas)"
  fi

  if (( $+commands[gcc] )); then
    alias gcc="$(whence grc) --colour=auto $(whence gcc)"
  fi

  if (( $+commands[g++] )); then
    alias g++="$(whence grc) --colour=auto $(whence g++)"
  fi

  if (( $+commands[last] )); then
    alias last="$(whence grc) --colour=auto $(whence last)"
  fi

  if (( $+commands[ld] )); then
    alias ld="$(whence grc) --colour=auto $(whence ld)"
  fi

  if (( $+commands[ifconfig] )); then
    alias ifconfig="$(whence grc) --colour=auto $(whence ifconfig)"
  fi

  if (( $+commands[mount] )); then
    alias mount="$(whence grc) --colour=auto $(whence mount)"
  fi

  if (( $+commands[mtr] )); then
    alias mtr="$(whence grc) --colour=auto $(whence mtr)"
  fi

  if (( $+commands[netstat] )); then
    alias netstat="$(whence grc) --colour=auto $(whence netstat)"
  fi

  if (( $+commands[ping] )); then
    alias ping="$(whence grc) --colour=auto $(whence ping)"
  fi

  if (( $+commands[ping6] )); then
    alias ping6="$(whence grc) --colour=auto $(whence ping6)"
  fi

  if (( $+commands[ps] )); then
    alias ps="$(whence grc) --colour=auto $(whence ps)"
  fi

  if (( $+commands[traceroute] )); then
    alias traceroute="$(whence grc) --colour=auto $(whence traceroute)"
  fi

fi
