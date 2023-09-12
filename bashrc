#!/bin/bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
alias factory="~/Dev/FetView/server-factory-dev/bin/factory.sh"

set -o vi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTCONTROL=erasedups:ignoredups:ignorespace
#HISTTIMEFORMAT="%F %T "
PROMPT_COMMAND='history -a'
shopt -s histappend

# Source global definitions
if [ -f /etc/bashrc ]; then
	 . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Create a backup dir for vim
mkdir -p ~/.vim_backup

#######################################################
# EXPORTS
#######################################################
iatest=$(expr index "$-" i)

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=vim
export VISUAL=vim

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

alias g='git'
alias gs='git status'
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'
alias glg='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'

alias l='ls -lG --color --group-directories-first -A -v -h'
alias ll='ls -lG --color --group-directories-first -A -v -h'
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'

alias c='clear'
alias h='history'
alias rmf='rm -rf'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

function hg() {
    history | grep "$1";
}

function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\n$ylw$(hostname) $pur\w$blu\$(parse_git_branch)$grn $ $clr"

function git_init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name.";
    else
        mkdir "$1";
        builtin cd "$1";
        pwd;
        git init;
        touch readme.md .gitignore LICENSE;
        echo "# $(basename $PWD)" >> readme.md
    fi
}

clear

printf "\n"
printf "   %s\n" "HOSTNAME: $(hostname)"
printf "   %s\n" "USER: $(echo $USER)"
printf "   %s\n" "DATE: $(date)"
printf "   %s\n" "UPTIME: $(uptime -p)"
printf "   %s\n" "KERNEL: $(uname -rms)"
printf "   %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
