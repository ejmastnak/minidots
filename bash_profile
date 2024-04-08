export EDITOR="vim"
export PAGER="less"

# Personal scripts
export PATH="${PATH}:${HOME}/scripts"

# Source Bash interactive shell config if this is an interactive shell
if [ "$PS1" ]; then
  . "${HOME}/.bashrc"
fi
