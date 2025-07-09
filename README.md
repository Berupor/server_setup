# Server Setup

This is my personal way to get a fresh server up and running in minutes.

## Quick Start

On a fresh Ubuntu/Debian server, first install Git:

```bash
sudo apt update
sudo apt install -y git
````

Then clone and run the full setup:

```bash
git clone https://github.com/yourname/server-setup.git
cd server-setup
cp config.sh.example config.sh   # edit USERNAME, SSH_PORT, etc.
task                              # runs all setup steps, now including kitty terminfo
```

