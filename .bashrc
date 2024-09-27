# append commands to history file immediately (not at end of session).
export PROMPT_COMMAND='history -a'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=50000

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

alias fs='[ -n "$TMUX" ] && eval $(tmux showenv -s SSH_AUTH_SOCK) && fc -s'
alias news-err='cat ~/.newsboat/error.log | awk {'\''print $6'\''} | sort -nr | uniq -c | sort -nr'
alias upgrade='sudo apt update; sudo apt full-upgrade; sudo apt autoremove'
alias vim-notes='cd /$HOME/.vim/bundle/vim-notes/misc/notes/user'

alias gaa="git add -a"
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
alias gl="git log"
alias glp="git log -p"
alias gls="git log -s"
alias gll="git log -n 1"
alias glsl="git log -n 1 --stat"
alias glpl="git log -n 1 -p"
alias gl5="git log -n 5"
alias gls5="git log -n 5 --stat"
alias glp5="git log -n 5 -p"
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
alias gstap="git stash -p"
alias gstac="git stash -c"
alias gstad="git stash -d"
alias gsh="git show"
alias gshl="git shortlog -sn"
alias gucb="branch=\$(git branch --show-current); git checkout main; git pull; git checkout \$branch; git rebase main"
alias gucbm="branch=\$(git branch --show-current); git checkout master; git pull; git checkout \$branch; git rebase master"
alias gac!="git add -u && git commit --amend --no-edit"
alias gacp!="git add -u && git commit --amend --no-edit && git push --force-with-lease"

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
