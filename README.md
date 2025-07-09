# Server Setup

This is my personal way to get a fresh server up and running in minutes.

## Quick Start

On a fresh Ubuntu/Debian server, first install Git and Taskfile:

```bash
sudo apt update
sudo apt install -y git

curl -sL https://taskfile.dev/install.sh | sudo bash -s -- -b /usr/local/bin
````

Then clone and run the full setup:

```bash
git clone https://github.com/berupor/server_setup.git
cd server_setup
chmod +x install/*.sh
cp config.sh.example config.sh   # edit USERNAME, SSH_PORT, etc.
task                              # runs all setup steps, now including kitty terminfo
```

