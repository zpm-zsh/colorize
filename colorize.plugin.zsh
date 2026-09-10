#!/usr/bin/env zsh

DEPENDENCES_ARCH+=( grc )
DEPENDENCES_DEBIAN+=( grc )
DEPENDENCES_BREW+=( grc )

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
export LESS_TERMCAP_md="${c[bold]}${c[springgreen]}${c[italic]:-${c[coursive]}}" # start bold
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
    "$@"
}

alias ip="ip -color"
alias grep="grep --colour=auto"
alias egrep="egrep --colour=auto"
alias fgrep="fgrep --colour=auto"

if [[ $(uname) == "Darwin" ]]; then
  if (( $+commands[grc] )); then
    alias diff="grc --colour=auto diff"
  fi
else
  alias diff="diff --color=auto"
fi

if (( $+commands[grc] )); then
  for name in env lsblk as dig gas gcc g++ last ld ifconfig mount mtr netstat ss ping ping6 ps traceroute lsmod lspci; do
    if (( $+commands[$name] )); then
      alias $name="grc --colour=auto $name"
    fi
  done
  unset name

  alias df="grc --colour=auto df -h"
  alias du="grc --colour=auto du -h"
  alias free="grc --colour=auto free -h"
else
  alias df="df -h"
  alias du="du -h"
  alias free="free -h"
fi
