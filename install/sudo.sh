#!/usr/bin/env bash
set -euo pipefail

echo "▶ Disabling sudo password for user ${USERNAME}…"

if sudo test -f /etc/sudoers.d/nopasswd; then
  sudo cp /etc/sudoers.d/nopasswd /etc/sudoers.d/nopasswd.bak
  echo "  ↳ Backup saved to /etc/sudoers.d/nopasswd.bak"
fi

echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nopasswd > /dev/null

sudo chmod 0440 /etc/sudoers.d/nopasswd

echo "✔ Passwordless sudo enabled for ${USERNAME}."
