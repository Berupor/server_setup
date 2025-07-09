set -euo pipefail

echo "▶ Updating package list and installing base packages..."
sudo apt update
xargs -a packages.txt sudo apt install -y

echo "▶ Applying Neovim config..."
mkdir -p ~/.config/nvim
cp dotfiles/nvim/init.lua ~/.config/nvim/init.lua

echo "▶ Applying dotfiles..."
cp dotfiles/.bashrc ~/