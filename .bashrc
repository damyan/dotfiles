# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR="vim"
export GOPATH=~/go
export HISTTIMEFORMAT="%d/%m/%y %T "
export HTTP_PROXY=""
export LC_ALL="en_US.UTF-8"
#export LS_COLORS="no=00:fi=00:di=01:ln=00:pi=00:so=00:bd=00:cd=00:or=00:ex=00"
export PATH="/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$HOME/bin:$PATH"
export TERM=xterm-256color

echo -e "\033[0;31mHostname \033[1;37m: \033[1;33m$(hostname)"
echo -e "\033[0;31mOS \033[1;37m:" "\033[1;33m$(uname -a)"
echo -e "\033[0;31mUptime \033[1;37m: \033[1;33m$(uptime)"
echo -e "\033[0;31mLocal Time \033[1;37m: \033[1;33m$(date)"
echo -e "\033[0;31mDirectory \033[1;37m: \033[1;33m$(pwd)"
echo -e "\033[0;31m\033[1;37m\033[1;33m$(df -h -x tmpfs)\033[0;29m"

alias git-bash='GIT_PROMPT_ONLY_IN_REPO=1; source ~/.bash-git-prompt/gitprompt.sh'
alias git-clean-local='git branch -vv | fgrep ": gone]" | awk '\''{ print $1 }'\'' | xargs -n 1 git branch -D'
alias k='kubectl'
alias start-vm-pxe='sudo /media/data/vm/start-vm-damyan --bridge mgmt0 --pxe /media/data/vm/damyan'
alias start-vm='sudo /media/data/vm/start-vm-damyan --bridge mgmt0 /media/data/vm/damyan.raw'
alias upgrade='sudo apt update; sudo apt full-upgrade; sudo apt autoremove'
alias vim-notes='cd /$HOME/.vim/bundle/vim-notes/misc/notes/user'

# create and enter directory
mcd() { mkdir -p "$1" && cd "$1"; }

# ssh agent
# git bash by default
GIT_PROMPT_ONLY_IN_REPO=1; source ~/.bash-git-prompt/gitprompt.sh

# needed for git PGP-signed commits
export GPG_TTY=$(tty)

#eval `keychain -q id_rsa --eval`
alias get-config4='curl -X POST -H "Content-Type: application/json" -d '\''{ "command": "config-get", "service": [ "dhcp4" ] }'\'' http://10.96.10.3:8000/ | jq'
alias get-config6='curl -X POST -H "Content-Type: application/json" -d '\''{ "command": "config-get", "service": [ "dhcp6" ] }'\'' http://10.96.10.3:8000/ | jq'
alias get-leases4='curl -X POST -H "Content-Type: application/json" -d '\''{ "command": "lease4-get-all", "service": [ "dhcp4" ] }'\'' http://10.96.10.3:8000/ | jq'
alias get-leases6='curl -X POST -H "Content-Type: application/json" -d '\''{ "command": "lease6-get-all", "service": [ "dhcp6" ] }'\'' http://10.96.10.3:8000/ | jq'

# auto completion
command -v flux >/dev/null && . <(flux completion bash)
command -v kubectl >/dev/null && . <(kubectl completion bash)
command -v kustomize >/dev/null && . <(kustomize completion bash)
