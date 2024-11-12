# .bash_profile

# Load environment variables and PATH adjustments
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export PATH="${PATH}:${HOME}/bin:/usr/local/mcomm/bin"
umask 022

# GPG and SSH agent setup (only for login shells)
GPG_TTY=$(/usr/bin/tty)
SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export GPG_TTY SSH_AUTH_SOCK

# Source .bashrc for interactive shell settings
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
