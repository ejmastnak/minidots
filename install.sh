#!/bin/bash
# NAME
#     install.sh - Link dotfiles into place.
# 
# SYNOPSIS
#     install.sh [-o]
#
# A simple shell script used to link dotfiles into place.
# IMPORTANT: the script should be run from within dotfiles directory.

# Get the directory containing the script and convert to absolute path
BASEDIR=$(dirname "${BASH_SOURCE[0]}")
BASEDIR=$(cd "${BASEDIR}" && pwd)

overwrite=0

while getopts ":o" flag
do
  case "${flag}" in
    o) overwrite=1;;
    \?) # Invalid option
      echo "Usage: install.sh [-o]"
      exit;;
  esac
done

dirs=("config" "vim")
files=("bash_profile" "bashrc" "inputrc")

# Link directories
for dir in "${dirs[@]}"; do
  if [[ -d "${HOME}/.${dir}" || -L "${HOME}/.${dir}" ]]; then
    if [[ ${overwrite} -eq 1 ]]; then
      rm -rf "${HOME}/.${dir}"
      ln -s ${BASEDIR}/${dir} "${HOME}/.${dir}"
    else
      echo "~/.${dir} exists; skipping and not overwriting."
    fi
  else
    ln -s ${BASEDIR}/${dir} "${HOME}/.${dir}"
  fi
done

# Link stand-alone files not in XDG_CONFIG
for file in "${files[@]}"; do
  if [[ -e "${HOME}/.${file}" || -L "${HOME}/.${file}" ]]; then
    if [[ ${overwrite} -eq 1 ]]; then
      rm "${HOME}/.${file}"
      ln -s ${BASEDIR}/${file} "${HOME}/.${file}"
    else
      echo "~/.${file} exists; skipping and not overwriting."
    fi
  else
    ln -s ${BASEDIR}/${file} "${HOME}/.${file}"
  fi
done

# Try installing Vim plugins (if Vim is installed and executable)
[[ -x "$(command -v vim)" ]] && vim -c "PlugInstall|quitall"
