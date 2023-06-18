#!/usr/bin/env zsh

DEPENDENCES_ARCH+=( grc )
DEPENDENCES_DEBIAN+=( grc )

# Zsh colors
if [[ "$CLICOLOR" != '0' ]]; then
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" 'ma=1;30;43'
fi

# GCC Colors
GCC_COLORS=''
GCC_COLORS+="error=${c[raw_bold]};${c[raw_red]}"
GCC_COLORS+=":warning=${c[raw_bold]};${c[raw_yellow]}"
GCC_COLORS+=":note=${c[raw_bold]};${c[raw_white]}"
GCC_COLORS+=":caret=${c[raw_bold]};${c[raw_white]}"
GCC_COLORS+=":locus=${c[raw_bg_black]};${c[raw_bold]};${c[raw_magenta]}"
GCC_COLORS+=":quote=${c[raw_bold]};${c[raw_yellow]}"

export GCC_COLORS

# Less Colors
export LESS="-r -M $LESS"

export LESS_TERMCAP_mb="${c[green]}"
export LESS_TERMCAP_md="${c[bold]}${c[blue]}${c[bg_black]}"
export LESS_TERMCAP_so="${c[bold]}${c[bg_yellow]}${c[black]}"
export LESS_TERMCAP_us="${c[green]}"

export LESS_TERMCAP_ue="${c[reset]}"
export LESS_TERMCAP_me="${c[reset]}"
export LESS_TERMCAP_se="${c[reset]}"

# Grep Colors
GREP_COLORS=''
GREP_COLORS+=":mt=${c[raw_bold]};${c[raw_cyan]}"
GREP_COLORS+=":ms=${c[raw_bg_red]};${c[raw_bold]};${c[raw_black]}"
GREP_COLORS+=":mc=${c[raw_bold]};${c[raw_bg_red]}"
GREP_COLORS+=':sl='
GREP_COLORS+=':cx='
GREP_COLORS+=":fn=${c[raw_bold]};${c[raw_magenta]};${c[raw_bg_black]}"
GREP_COLORS+=':ln=32'
GREP_COLORS+=':bn=32'
GREP_COLORS+=":se=${c[raw_bold]};${c[raw_cyan]};${c[raw_bg_black]}"

export GREP_COLORS

# Ag Colors
function ag() {
  command ag \
    --color-path "${c[raw_bg_black]};${c[raw_bold]};${c[raw_magenta]}"      \
    --color-match "${c[raw_bg_red]};${c[raw_bold]};${c[raw_black]}"         \
    --color-line-number "${c[raw_bg_black]};${c[raw_bold]};${c[raw_green]}" \
    $@
}

function ip() {
  command ip -color "$@"
}

function grep() {
  command grep --colour=auto "$@"
}

function egrep() {
  command egrep --colour=auto "$@"
}

function fgrep() {
  command fgrep --colour=auto "$@"
}

function diff() {
  command diff --color "$@"
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
    function "g++"(){
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
else
  function df() {
    command df -h "$@"
  }

  function du() {
    command du -h "$@"
  }

  function free() {
    command free -h "$@"
  }
fi
