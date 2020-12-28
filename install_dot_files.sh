#!/bin/bash

set -e

# debug only
#set -x
#trap read debug
#
suffix=$(date +%Y-%m-%d-%H-%M)
dot_files_folder="${HOME}/.dotfiles"
backup_folder="${HOME}/.backup"


if [ ! -d "${backup_folder}" ]; then
  mkdir -p ${backup_folder}
fi

#################### vim ####################
vim_folder=.vim
vim_config_file=vimrc
vim_config_path="${vim_folder}/${vim_config_file}"
vundle_folder="${vim_folder}/bundle/Vundle.vim"
vundle_repo=https://github.com/VundleVim/Vundle.vim.git

if [ -d "${HOME}/${vim_folder}" ]; then
  if [ -f "${HOME}/${vim_config_path}" ]; then
    mv ${HOME}/${vim_config_path} ${backup_folder}/${vim_config_file}-${suffix}
  fi
else
  mkdir -p "${HOME}/${vim_folder}"
fi
if [ ! -d "${HOME}/${vundle_folder}" ]; then
  git clone $vundle_repo "${HOME}/${vundle_folder}"
fi
cp ${dot_files_folder}/${vim_config_path} ${HOME}/${vim_config_path}
#################### vim ####################


#################### tmux ####################
tmux_config_path=.tmux.conf

if [ -f "${HOME}/${tmux_config_path}" ]; then
  mv ${HOME}/${tmux_config_path} ${backup_folder}/${tmux_config_path}-${suffix}
fi
cp ${dot_files_folder}/${tmux_config_path} ${HOME}/${tmux_config_path}
#################### tmux ####################


#################### BASH ####################
bash_config_path=.bashrc
git_bash_folder="${HOME}/.bash-git-prompt"
git_bash_repo=https://github.com/magicmonty/bash-git-prompt.git

if [ ! -d "${git_bash_folder}" ]; then
  git clone $git_bash_repo "${git_bash_folder}"
else
  pushd $git_bash_folder
  git pull
  popd
fi

if [ -f "${HOME}/${bash_config_path}" ]; then
  cp ${HOME}/${bash_config_path} ${backup_folder}/${bash_config_path}-${suffix}
fi
cat ${dot_files_folder}/${bash_config_path} >> ${HOME}/${bash_config_path}
#################### BASH ####################
