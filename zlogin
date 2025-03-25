if [[ "$(tty)" == "/dev/tty1" ]]; then
  if [[ -z "$DISPLAY" ]] && [[ "$(id -u)" -eq 1000 ]]; then
    exec startx
  fi
fi
