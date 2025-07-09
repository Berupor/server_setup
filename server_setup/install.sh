#!/bin/bash
set -euo pipefail

echo "▶ Updating packages..."
sudo apt update && sudo apt upgrade -y

echo "▶ Installing base packages..."
xargs -a packages.txt sudo apt install -y

# echo "▶ Copying dotfiles..."
# cp dotfiles/.bashrc ~/.bashrc
# cp dotfiles/.vimrc ~/.vimrc

echo "▶ Installing Docker..."
bash docker/install.sh

echo "▶ Setting up SSH config..."
sudo cp ssh/sshd_config /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "▶ Configuring sudo without password..."
sudo cp sudo/nopasswd /etc/sudoers.d/nopasswd
sudo chmod 0440 /etc/sudoers.d/nopasswd


echo "✅ Done! Re-login to apply shell config."
