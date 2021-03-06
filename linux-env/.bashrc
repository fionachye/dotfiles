
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias emacs='emacs -mm'
PS1='[\u@\h \w]\$ '
export EDITOR='nvim'
export VISUAL='nvim'

set -o vi

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

neofetch --refresh_rate on
