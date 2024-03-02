################################################################################
# .bashrc
################################################################################

# Alias

alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

# Python shortcuts
alias python=python3
alias py=python
alias va='source myvenv/bin/activate'

alias wh='whois $(pbpaste)'

# SSH shortcuts
alias s400='ssh nmr2@172.16.51.134'
alias s300='ssh nmr@172.16.51.133'
alias sdep='ssh RMN-Pro@172.16.51.124'

# Config Files Shortcuts
alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias vv='vim ~/.vimrc'

# Django shortcuts
alias djr='python manage.py runserver'
alias djm='python manage.py migrate'
alias djmk='python manage.py makemigrations'

# Coverage.py shortcuts
alias coh='coverage run manage.py test;coverage html;open htmlcov/index.html;'

JAUNE="\[\e[33;40m\]" #"\033[0;33;40m"
VERT="\[\e[32;40m\]" #"\033[0;32;40m"
CYAN="\[\e[36;40m\]"
ROUGE="\[\e[91;40m\]"
NC="\[\e[0m\]"

# git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="$VERT\u$CYAN@\h$JAUNE:\W $ROUGE\$(parse_git_branch)\n$NC$  "
export BASH_SILENCE_DEPRECATION_WARNING=1”

