#!/bin/bash

set -e

# debug only
#set -x
#trap read debug
#
suffix=$(date +%Y-%m-%d-%H-%M)
dot_files_folder="${HOME}/.dotfiles"


#################### vim ####################
vim_folder=.vim
vim_config_file=vimrc
vim_config_path="${vim_folder}/${vim_config_file}"
vundle_folder="${vim_folder}/bundle/Vundle.vim"
vundle_repo=https://github.com/VundleVim/Vundle.vim.git

if [ -d "${HOME}/${vim_folder}" ]; then
  if [ ! -d "${HOME}/${vundle_folder}" ]; then
    git clone $vundle_repo "${HOME}/${vundle_folder}"
  fi
  if [ -f "${HOME}/${vim_config_path}" ]; then
    mv ${HOME}/${vim_config_path} ${HOME}/${vim_config_path}-${suffix}
  fi
else
  mkdir -p "${HOME}/${vim_folder}"
fi

cp ${dot_files_folder}/${vim_config_path} ${HOME}/${vim_config_path}
#################### vim ####################


#################### tmux ####################
tmux_config_path=.tmux.conf

if [ -f "${HOME}/${tmux_config_path}" ]; then
  mv ${HOME}/${tmux_config_path} ${HOME}/${tmux_config_path}-${suffix}
fi
cp ${dot_files_folder}/${tmux_config_path} ${HOME}/${tmux_config_path}
#################### tmux ####################


#################### BASH ####################
bash_config_path=.bashrc

if [ -f "${HOME}/${bash_config_path}" ]; then
  cp ${HOME}/${bash_config_path} ${HOME}/${bash_config_path}-${suffix}
fi
cat ${dot_files_folder}/${bash_config_path} >> ${HOME}/${bash_config_path}
#################### BASH ####################
