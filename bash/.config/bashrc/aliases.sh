
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

s() {
  if [ ${#} -eq 0 ]; then
    ls -alF
  elif [ -d "${1}" ]; then
    ls -alF "$@"
  else
    cat "$@"
  fi
}
