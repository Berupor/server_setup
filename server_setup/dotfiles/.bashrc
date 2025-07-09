
[ -z "$PS1" ] && return

# Aliases
alias ll='ls -lah'
export EDITOR=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Custom prompt
PS1='\u@\h:\w\$ '