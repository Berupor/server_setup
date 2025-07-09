set -euo pipefail

echo "▶ Configuring SSH..."

# Backup original config
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Apply new settings
sudo tee /etc/ssh/sshd_config > /dev/null <<EOF
# sshd_config template
Port $SSH_PORT
PermitRootLogin prohibit-password
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM yes
EOF

echo "▶ Restarting SSH service..."
sudo systemctl restart ssh || sudo systemctl restart sshd