#! /bin/bash

function _pass-show() {
  command -v fzf 2>&1 > /dev/null
  has_fzf=$?

  if [ "$has_fzf" -eq "0" ];
  then
    pass show $2 $(pass --plain --no-header | fzf)
  else
    pass show $2 $1
  fi
}
function _pass-show-clip() {
  _pass-show $1 '--clip'
}
function _pass-show-xclip() {
  _pass-show $1 | xclip -selection clipboard
}
alias psc=_pass-show-clip
alias psx=_pass-show-xclip
alias pso=_pass-show
