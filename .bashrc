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

# append commands to history file immediately (not at end of session).
export PROMPT_COMMAND='history -a'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export EDITOR="vim"
export GOPATH=~/go
export HISTTIMEFORMAT="%d/%m/%y %T "
export HTTP_PROXY=""
export LC_ALL="en_US.UTF-8"
export LOCALDOMAIN="0x4711.org"
#export LS_COLORS="no=00:fi=00:di=01:ln=00:pi=00:so=00:bd=00:cd=00:or=00:ex=00"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:$GOPATH/bin:$PATH"
export TERM=xterm-256color

echo -e "\033[0;31mHostname \033[1;37m: \033[1;33m$(hostname)"
echo -e "\033[0;31mOS \033[1;37m:" "\033[1;33m$(uname -a)"
echo -e "\033[0;31mUptime \033[1;37m: \033[1;33m$(uptime)"
echo -e "\033[0;31mLocal Time \033[1;37m: \033[1;33m$(date)"
echo -e "\033[0;31mDirectory \033[1;37m: \033[1;33m$(pwd)"
echo -e "\033[0;31m\033[1;37m\033[1;33m$(df -h)\033[0;29m"

alias fs='[ -n "$TMUX" ] && eval $(tmux showenv -s SSH_AUTH_SOCK) && fc -s'
alias news-err='cat ~/.newsboat/error.log | awk {'\''print $6'\''} | sort -nr | uniq -c | sort -nr'
alias upgrade='sudo apt update; sudo apt full-upgrade; sudo apt autoremove'
alias vim-notes='cd /$HOME/.vim/bundle/vim-notes/misc/notes/user'
alias git-clean-local='git branch -vv | fgrep ": gone]" | awk '\''{ print $1 }'\'' | xargs -n 1 git branch -D'

alias ga="git add"
alias gaa="git add -A"
alias gac!="git add -u && git commit --amend --no-edit"
alias gacp!="git add -u && git commit --amend --no-edit && git push --force-with-lease"
alias gacep!="git add -u && git commit --amend && git push --force-with-lease"
alias gap="git add -p"
alias gau="git add -u"
alias gb="git branch -avv"
alias gco="git checkout"
alias gc="git commit"
alias gcm="git commit --message"
alias gc!="git commit --amend --no-edit"
alias gce!="git commit --amend"
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log --perl-regexp --author='^((?!dependabot).*)$'"
alias glp="git log -p --perl-regexp --author='^((?!dependabot).*)$'"
alias gls="git log --stat --perl-regexp --author='^((?!dependabot).*)$'"
alias gll="git log -n 1 --perl-regexp --author='^((?!dependabot).*)$'"
alias glsl="git log -n 1 --stat --perl-regexp --author='^((?!dependabot).*)$'"
alias glpl="git log -n 1 -p --perl-regexp --author='^((?!dependabot).*)$'"
alias gl5="git log -n 5 --perl-regexp --author='^((?!dependabot).*)$'"
alias gls5="git log -n 5 --stat --perl-regexp --author='^((?!dependabot).*)$'"
alias glp5="git log -n 5 -p --perl-regexp --author='^((?!dependabot).*)$'"
alias gp="git push"
alias gpu="git pull -p"
alias gp!="git push --force-with-lease"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias grm="git rebase main"
alias grim="git rebase -i main"
alias grmm="git rebase master"
alias grimm="git rebase -i master"
alias grs="git reset"
alias grsh="git reset --hard"
alias gres="git restore -SW"
alias grv="git remote -v"
alias gst="git status"
alias gstb="git status -b"
alias gsta="git stash"
alias gstap="git stash pop"
alias gstac="git stash clean"
alias gstad="git stash drop"
alias gsh="git show"
alias gshl="git shortlog -sn"
alias gucb="branch=\$(git branch --show-current); git checkout main; git pull; git checkout \$branch; git rebase main"
alias gucbm="branch=\$(git branch --show-current); git checkout master; git pull; git checkout \$branch; git rebase master"
__git_complete ga _git_add
__git_complete gap _git_add
__git_complete gco _git_checkout
__git_complete gd _git_diff
__git_complete gp _git_push

# create and enter directory
mcd() { mkdir -p "$1" && cd "$1"; }

# ssh agent
eval `keychain -q id_rsa --eval`

# git bash by default
# GIT_PROMPT_ONLY_IN_REPO=1; source ~/.bash-git-prompt/gitprompt.sh

# starship shell by default
eval "$(starship init bash)"

# needed for git PGP-signed commits
export GPG_TTY=$(tty)
