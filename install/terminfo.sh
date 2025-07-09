#!/bin/bash
set -euo pipefail

echo "▶ Installing kitty terminfo for xterm-kitty…"

if apt-cache show kitty-terminfo >/dev/null 2>&1; then
  sudo apt install -y kitty-terminfo
else
  echo "↳ Fallback: downloading compiled terminfo blob"
  sudo mkdir -p /usr/share/terminfo/x
  curl -fsSL \
    https://github.com/kovidgoyal/kitty/blob/master/terminfo/x/xterm-kitty?raw=true \
    | sudo tee /usr/share/terminfo/x/xterm-kitty > /dev/null
fi

echo "✔ kitty terminfo installed"
