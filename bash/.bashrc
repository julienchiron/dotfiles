################################################################################
# .bashrc
################################################################################

# Alias

alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -aG'
alias python=python3

alias wh='whois $(pbpaste)'

# SSH shortcuts
alias s400='ssh nmr2@172.16.51.134'
alias sdep='ssh RMN-Pro@172.16.51.124'

# Config Files Shortcuts
alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias vv='vim ~/.vimrc'

JAUNE="\[\e[33;40m\]" #"\033[0;33;40m"
VERT="\[\e[32;40m\]" #"\033[0;32;40m"
CYAN="\[\e[36;40m\]"
NC="\[\e[0m\]"

export PS1="$VERT\u$CYAN@\h$JAUNE:\W $NC$"
