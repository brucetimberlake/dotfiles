# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

#set -o nounset     # These  two options are useful for debugging.
#set -o xtrace
alias debug="set -o nounset; set -o xtrace"

ulimit -S -c 0      # Don't want coredumps.

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
shopt -s extglob       # Necessary for programmable completion
shopt -s histappend
shopt -s no_empty_cmd_completion
shopt -s sourcepath

# Disabled options
shopt -u mailwarn

unset MAILCHECK        # Don't want my shell to warn me of incoming mail.

umask 022

# Determine if we are on a prod or non-prod server
CHECKENV=$(grep ^Status: /usr/local/etc/purpose | cut -d' ' -f2)
if [ "$CHECKENV" == "Production" ]; then
  HOSTENV="PROD"
else
  HOSTENV="NONPROD"
fi

# https://news.sherlock.stanford.edu/posts/when-setting-an-environment-variable-gives-you-a-40-x-speedup
# don't colorize files based on their file capabilities, setuid/setgid bits or executable flag.
export LS_COLORS='ex=00:su=00:sg=00:ca=00:'

export PS1='[\u@\h ($HOSTENV) \W]\$ '
export PATH="${PATH}:${HOME}/bin:/usr/local/mcomm/bin"
export EDITOR=vim
export HISTSIZE=10000
export HISTTIMEFORMAT='%F %T '
export PAGER=less

GPG_TTY=$(/usr/bin/tty)
SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export GPG_TTY SSH_AUTH_SOCK
