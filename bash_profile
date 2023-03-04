export EDITOR="vim"
export PAGER="less"

# Source Bash interactive shell config if this is an interactive shell
if [ "$PS1" ]; then
  . "${HOME}/.bashrc"
fi
