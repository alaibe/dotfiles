# Do not autoupdate tmux window titles
log() {
  echo "$*" >> ~/foo.log
}

export DISABLE_AUTO_TITLE="true"

alias tls="tmux list-sessions"

tm-select-session() {
  project=$(projects | fzf --reverse)
  if [ ! -z "$project" ]; then
    (cd "$project" && tat)
  fi
}

_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}
