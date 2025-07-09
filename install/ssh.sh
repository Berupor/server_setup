#!/usr/bin/env bash
set -euo pipefail

echo "▶ Configuring SSH on port ${SSH_PORT}…"

# Backup original
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Write new config
sudo tee /etc/ssh/sshd_config > /dev/null <<EOF
# sshd_config template
Port ${SSH_PORT}
PermitRootLogin prohibit-password
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM yes
EOF

echo "▶ Restarting SSH service…"
sudo systemctl restart ssh.service 2>/dev/null \
  || sudo systemctl restart sshd.service 2>/dev/null \
  || echo "⚠️  Could not restart SSH — please run 'sudo systemctl restart ssh' or 'sudo systemctl restart sshd'" >&2

echo "✔ SSH configured."