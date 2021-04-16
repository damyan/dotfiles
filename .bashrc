export EDITOR="vim"
export GOPATH=~/go
export HISTTIMEFORMAT="%d/%m/%y %T "
export HTTP_PROXY=""
export LC_ALL="en_US.UTF-8"
export LOCALDOMAIN="0x4711.org"
#export LS_COLORS="no=00:fi=00:di=01:ln=00:pi=00:so=00:bd=00:cd=00:or=00:ex=00"
export PATH="/sbin:/usr/sbin:$GOPATH/bin:$HOME/bin:$PATH"
export TERM=xterm-256color

echo -e "\033[0;31mHostname \033[1;37m: \033[1;33m$(hostname)"
echo -e "\033[0;31mOS \033[1;37m:" "\033[1;33m$(uname -a)"
echo -e "\033[0;31mUptime \033[1;37m: \033[1;33m$(uptime)"
echo -e "\033[0;31mLocal Time \033[1;37m: \033[1;33m$(date)"
echo -e "\033[0;31mDirectory \033[1;37m: \033[1;33m$(pwd)"
echo -e "\033[0;31m\033[1;37m\033[1;33m$(df -h -x tmpfs)\033[0;29m"

alias git-bash='GIT_PROMPT_ONLY_IN_REPO=1; source ~/.bash-git-prompt/gitprompt.sh'
alias news-err='cat ~/.newsboat/error.log | awk {'\''print $6'\''} | sort -nr | uniq -c | sort -nr'
alias upgrade='sudo apt update; sudo apt full-upgrade; sudo apt autoremove'
alias vim-notes='cd /$HOME/.vim/bundle/vim-notes/misc/notes/user'

# ssh agent
eval `keychain -q id_rsa --eval`

