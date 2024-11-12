# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Debugging alias
alias debug="set -o nounset; set -o xtrace"

# Shell options for interactive use
set -o emacs
set -o notify
set -o noclobber
set -o ignoreeof

# Enabled options
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histappend
shopt -s no_empty_cmd_completion
shopt -s sourcepath

# Disabled options
shopt -u mailwarn
unset MAILCHECK

# Environment prompt configuration
CHECKENV=$(grep ^Status: /usr/local/etc/purpose | cut -d' ' -f2)
HOSTENV=$([[ "$CHECKENV" == "Production" ]] && echo "PROD" || echo "NONPROD")
export PS1='[\u@\h ($HOSTENV) \W]\$ '

# Personal environment variables
export EDITOR=vim
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export PAGER=less

# GPG and SSH settings
GPG_TTY=$(/usr/bin/tty)
SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export GPG_TTY SSH_AUTH_SOCK

# Disable LS_COLORS for faster directory listing
export LS_COLORS='ex=00:su=00:sg=00:ca=00:'
