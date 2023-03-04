#!/bin/bash
# A simple shell script used to link dotfiles into place. 
# Important: should be run from within dotfiles directory.

BASEDIR="$(pwd)"

# Long directories
[[ ! -d "${HOME}/.config" ]]       && ln -s ${BASEDIR}/config ~/.config || echo '~/.config exists; skipping and not overwriting.'
[[ ! -d "${HOME}/.vim" ]]          && ln -s ${BASEDIR}/vim ~/.vim; mkdir ~/.vim/plugged || echo '~/.vim exists; skipping and not overwriting.'

# Link stand-alone files not in XDG_CONFIG
[[ ! -e "${HOME}/.bash_profile" ]] && ln -s ${BASEDIR}/bash_profile ~/.bash_profile || echo '~/.bash_profile exists; skipping and not overwriting.'
[[ ! -e "${HOME}/.bashrc" ]]       && ln -s ${BASEDIR}/bashrc ~/.bashrc || echo '~/.bashrc exists; skipping and not overwriting.'
[[ ! -e "${HOME}/.inputrc" ]]      && ln -s ${BASEDIR}/inputrc ~/.inputrc || echo '~/.inputrc exists; skipping and not overwriting.'
