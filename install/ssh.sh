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
# try both service names but don’t exit on failure
if sudo systemctl restart ssh; then
  echo "✔ Restarted ssh.service"
elif sudo systemctl restart sshd; then
  echo "✔ Restarted sshd.service"
else
  echo "⚠️  Could not restart SSH service — please run one of:" \
       "'sudo systemctl restart ssh' or 'sudo systemctl restart sshd'" >&2
fi
