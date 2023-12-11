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

export LESS_TERMCAP_mb="${c[green]}" # start blink
export LESS_TERMCAP_md="${c[bold]}${c[springgreen]}${c[coursive]}" # start bold
export LESS_TERMCAP_so="${c[bold]}${c[bg_yellow]}${c[black]}" # start standout
export LESS_TERMCAP_us="${c[underline]}${c[azure]}" # start underline

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
  local opt
  [[ -t 1 ]] && opt=-color
  command ip $opt "$@"
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

if [[ $(uname) == "Darwin" ]]; then
  if (( $+commands[grc] )); then
    function diff() {
      command grc --colour=auto diff "$@"
    }
  fi
else
  function diff() {
    command diff --color=auto "$@"
  }
fi

if (( $+commands[grc] )); then
  for name in env lsblk as dig gas gcc g++ last ld ifconfig mount mtr netstat ss ping ping6 ps traceroute lsmod lspci; do
    if (( $+commands[$name] )); then
      function $name() {
        command grc --colour=auto $0 "$@"
      }
    fi
  done
  unset name

  function df() {
    command grc --colour=auto df -h "$@"
  }

  function du() {
    command grc --colour=auto du -h "$@"
  }

  function free() {
    command grc --colour=auto free -h "$@"
  }

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
