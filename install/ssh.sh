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
# try Ubuntu’s ssh.service, then generic sshd.service, but never exit non-zero
if sudo systemctl restart ssh.service   2>/dev/null; then
  echo "✔ Restarted ssh.service"
elif sudo systemctl restart sshd.service 2>/dev/null; then
  echo "✔ Restarted sshd.service"
else
  echo "⚠️  Could not restart SSH — please run manually:" \
       "'sudo systemctl restart ssh.service' or 'sudo systemctl restart sshd.service'" >&2
fi

echo "✔ SSH configuration applied."
